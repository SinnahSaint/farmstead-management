class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        @user.events.create!(description: "Created User", detail: "{ id: #{@user.id}, name: #{@user.name}, }") ## will make a linked event
        format.html { redirect_to user_url(@user), notice: "User was successfully created." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        # OMFG!
        if @user.name_previously_changed? || @user.email_previously_changed? || @user.phone_previously_changed?
          @user.events.create!(description: "User Info Changed", detail: "{ id: #{@user.id}, changes: #{@user.previous_changes.except(:inactive, :updated_at)} ")
        end
        if @user.inactive_previously_changed?
          if @user.previous_changes[:inactive].second == true
            @user.events.create!(description: "User Deactivated", detail: "id: #{@user.id}")
          else
            @user.events.create!(description: "User Reactivated", detail: "id: #{@user.id}")
          end
        end
        # OMFG!
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :phone, :email, :inactive)
    end
end
