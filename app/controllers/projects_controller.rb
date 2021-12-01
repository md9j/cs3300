class ProjectsController < ApplicationController
  before_action :set_project, only: %i[ show edit update destroy ]    #only: %i[ show edit update destroy ]except: [:index, :show]
  before_action :authenticate_user!, except: [:show]

  # GET /projects or /projects.json
  def index
    @projects = Project.all
  end

  # GET /projects/1 or /projects/1.json
  def show
  end

  # GET /projects/new
  def new
    authenticate_user!
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects or /projects.json
  def create
    @project = Project.new(project_params)
    # #added 16NOV2021 before_action :authenticate_user! per class/devise instruction
    # before_action :authenticate_user!
    # member_signed_in?
    # current_member
    # member_session  
   

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: "Project was successfully created." }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1 or /projects/1.json
  def update
    # #added 16NOV2021 before_action :authenticate_user! per class/devise instruction
    # before_action :authenticate_user!
    # member_signed_in?
    # current_member
    # member_session 

    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: "Project was successfully updated." }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1 or /projects/1.json
  def destroy
    # #added 16NOV2021 before_action :authenticate_user! per class/devise instruction
    #before_action :authenticate_user!
    # member_signed_in?
    # current_member
    # member_session 

    @project.destroy
    respond_to do |format|
      format.html { redirect_to projects_url, notice: "Project was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def project_params
      params.require(:project).permit(:title, :description)
    end
end
