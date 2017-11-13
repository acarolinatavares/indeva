class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_owner!

  def current_ability
    @current_ability ||= Ability.new(current_owner)
  end
end
