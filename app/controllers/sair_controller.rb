class SairController < ApplicationController
  def index
  	reset_session
  	session.delete(:cliente)

  	redirect_to '/login/'
  end
end
