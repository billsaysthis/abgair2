class Api::OrganizationsController < Api::BaseController

  def index
    render json: task_list.tasks
  end

  def create
    task = task_list.tasks.create!(safe_params)
    render json: task, status: 201
  end

  def update
    task.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    task.destroy
    render nothing: true, status: 204
  end

  private
  def task_list
    @task_list ||= TaskList.find(params[:task_list_id])
  end

  def task
    @task ||= task_list.tasks.find(params[:id])
  end

  def safe_params
    params.require(:task).permit(:description, :target_priority, :completed, :due_date)
  end
end