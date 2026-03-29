class Users::RegistrationsController < Devise::RegistrationsController
  after_action :set_user_session, only: [:create]

  protected

  def set_user_session
    session[:user_id] = resource.id if resource.persisted?
  end
end
