class TodosController < ApplicationController

  before_filter :authenticate_user!

  def new
    @todo = Todo.new
  end

  def create
    @todo = current_user.todos.new(todo_params)
    @todo.done = false
    @todo.save

    redirect_to root_path
  end

  def edit
    @todo = current_user.todos.find(params[:id])
  end

  def update
    @todo = current_user.todos.find(params[:id])

    if @todo.update(todo_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    @todo = current_user.todos.find(params[:id])
    @todo.destroy

    redirect_to root_path
  end

  def update_order
    safe_params = params.require(:todo).permit(:id, :order_position)

    @todo = current_user.todos.find(safe_params[:id])
    @todo.order_position = safe_params[:order_position]
    @todo.save

    render nothing: true
  end

private

  def todo_params
    params.require(:todo).permit(:description, :due_date)
  end
end
