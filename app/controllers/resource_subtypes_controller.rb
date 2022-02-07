class ResourceSubtypesController < ApplicationController
  before_action :set_resource_subtype, only: %i[ show edit update destroy ]

  # GET /resource_subtypes or /resource_subtypes.json
  def index
    @resource_subtypes = ResourceSubtype.all
  end

  # GET /resource_subtypes/1 or /resource_subtypes/1.json
  def show
  end

  # GET /resource_subtypes/new
  def new
    @resource_subtype = ResourceSubtype.new
  end

  # GET /resource_subtypes/1/edit
  def edit
  end

  # POST /resource_subtypes or /resource_subtypes.json
  def create
    @resource_subtype = ResourceSubtype.new(resource_subtype_params)

    respond_to do |format|
      if @resource_subtype.save
        format.html { redirect_to resource_subtype_url(@resource_subtype), notice: "Resource subtype was successfully created." }
        format.json { render :show, status: :created, location: @resource_subtype }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @resource_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /resource_subtypes/1 or /resource_subtypes/1.json
  def update
    respond_to do |format|
      if @resource_subtype.update(resource_subtype_params)
        format.html { redirect_to resource_subtype_url(@resource_subtype), notice: "Resource subtype was successfully updated." }
        format.json { render :show, status: :ok, location: @resource_subtype }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @resource_subtype.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /resource_subtypes/1 or /resource_subtypes/1.json
  def destroy
    @resource_subtype.destroy

    respond_to do |format|
      format.html { redirect_to resource_subtypes_url, notice: "Resource subtype was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_resource_subtype
      @resource_subtype = ResourceSubtype.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resource_subtype_params
      params.require(:resource_subtype).permit(:name, :resource_type_id)
    end
end
