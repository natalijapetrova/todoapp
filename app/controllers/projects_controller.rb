class ProjectsController < ApplicationController
	before_action :authenticate_user!

  def index
  	 @projects = Project.all
  end

  def new
  @project = Project.new
end

def create
  @project = Project.new(project_params)
  if !@project.save
    render action: 'error'
  end
end

def destroy
  @project = Project.find(params[:id])
  @project.destroy
end

def edit
  @project = Project.find(params[:id])
end

def update
  @project = Project.find(params[:id])
  if !@project.update(project_params)
    render action: 'error'
  end
end



private
    def project_params
      params.require(:project).permit(:name)
    end 
end
