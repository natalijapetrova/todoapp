
class TasksController < ApplicationController
  
  before_action :authenticate_user!, except: [:index]
  before_action :set_task, only: [:edit, :update, :destroy]
  
  # GET /tasks
  # GET /tasks.json
  def index
    if params[:sorting]
      @done = Task.where(done: true).order(params[:sorting] => :desc)
      @todo = Task.where(done: false).order(params[:sorting] => :desc)
    else
      @done = Task.where(done: true).order(created_at: :desc)
      @todo = Task.where(done: false).order(updated_at: :desc)
    end
#    @done = Task.where(done: true).order(created_at: :desc)
#    @todo = Task.where(done: false).order(updated_at: :desc) 
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = current_user.tasks.new(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to tasks_url, notice: 'Task was successfully created.' }
        format.json { render action: 'show', status: :created, location: @task }
      else
        format.html { render action: 'new' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to tasks_url, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
      if @task.user_id != current_user.id && @task.delegated_id != current_user.id
        redirect_to tasks_url, alert: 'You can edit only your own Tasks.'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:name, :deadline, :done, :duration, :delegated_id, :project_id)
          end
end
