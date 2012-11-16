class UsersController < ApplicationController
  before_filter :authenticate_user!

  def seminar_registration
    @user = current_user
    @user.add_seminar(params[:id])

    redirect_to rasspisanie_url
  end
end