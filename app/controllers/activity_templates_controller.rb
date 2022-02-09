class ActivityTemplatesController < ApplicationController
  before_action :set_activity_template, only: %i[ show edit update destroy ]

  # GET /activity_templates or /activity_templates.json
  def index
    @activity_templates = ActivityTemplate.all
  end

  # GET /activity_templates/1 or /activity_templates/1.json
  def show
  end

  # GET /activity_templates/new
  def new
    @activity_template = ActivityTemplate.new
  end

  # GET /activity_templates/1/edit
  def edit
  end

  # POST /activity_templates or /activity_templates.json
  def create
    @activity_template = ActivityTemplate.new(activity_template_params)

    respond_to do |format|
      if @activity_template.save
        format.html { redirect_to activity_template_url(@activity_template), notice: "Activity template was successfully created." }
        format.json { render :show, status: :created, location: @activity_template }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @activity_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /activity_templates/1 or /activity_templates/1.json
  def update
    respond_to do |format|
      if @activity_template.update(activity_template_params)
        format.html { redirect_to activity_template_url(@activity_template), notice: "Activity template was successfully updated." }
        format.json { render :show, status: :ok, location: @activity_template }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @activity_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activity_templates/1 or /activity_templates/1.json
  def destroy
    @activity_template.destroy

    respond_to do |format|
      format.html { redirect_to activity_templates_url, notice: "Activity template was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_activity_template
      @activity_template = ActivityTemplate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def activity_template_params
      params.require(:activity_template).permit(:resource_subtype_id, :name, :description, :default_values, :yield)
    end
end
