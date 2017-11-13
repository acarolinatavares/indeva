class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_owner!
  layout :layout_by_resource

  def current_ability
    @current_ability ||= Ability.new(current_owner)
  end

  def layout_by_resource
    owner_signed_in? ? 'application' : 'application_devise'
  end
end
