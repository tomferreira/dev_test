class DashboardController < ApplicationController

  before_filter :authenticate_user!

  def index
    @todos = Todo.where( :user_id => current_user.id ) 
  end
end
