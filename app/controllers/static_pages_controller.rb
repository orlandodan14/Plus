class StaticPagesController < ApplicationController

  def home
  	new_user
  end

  def blog
  	new_user
  end

  def about
  	new_user
  end

  def contact
  	new_user
  end
  

  private

  	# Ser @user for the modal in all pages
  	def new_user
  		@user = User.new
  	end
end
