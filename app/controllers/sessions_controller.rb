class SessionsController < ApplicationController
  def new
   # @login = User.new
  end

  def create

  end

  def destroy
	reset_session
	redirect_to movies_path
  end

end
