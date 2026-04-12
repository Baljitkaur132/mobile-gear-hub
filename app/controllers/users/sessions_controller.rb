class Users::SessionsController < Devise::SessionsController
  after_action :set_user_session, only: [ :create ]
  after_action :clear_user_session, only: [ :destroy ]

  protected

  def set_user_session
    session[:user_id] = resource.id if resource.persisted?
  end

  def clear_user_session
    session.delete(:user_id)
  end
end
