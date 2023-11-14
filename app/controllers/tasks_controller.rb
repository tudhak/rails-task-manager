class TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.all
  end

  def show
    @done = @task.completed ? 'This task is completed' : 'This task is not completed yet'
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new(task_params)
    task.save
    # redirect_to task_path(task)
    redirect_to tasks_path
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end

  def find_task
    @task = Task.find(params['id'].to_i)
  end
end
