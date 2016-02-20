class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def show
    @todos_undone = Todo.undone.where( user_id: current_user.id ).rank(:order)
    @todos_done = Todo.done.where( user_id: current_user.id )
  end
end
