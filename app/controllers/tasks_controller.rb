class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def index
    @tasks = Task.all
  end

  def show
  end

  def destroy
    @task.destroy

    redirect_to tasks_path
  end

  def new
    # empty template for form_for view helper
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      # no specific view for create
      redirect_to task_path(@task)
    else
      # inform user that task is not valid
    end
  end

  def edit

  end

  def update
    @task.update(task_params)

    # no specific view for update
    redirect_to task_path(@task)
  end

  private

  def set_task
    # KEEP IT DRY, this method is called thanks to before_action callback (see top)
    @task = Task.find(params[:id])
  end

  def task_params
    # to avoid malicious users to corrupt HTML forms
    params.require(:task).permit(:title, :detail, :completed)
  end
end
