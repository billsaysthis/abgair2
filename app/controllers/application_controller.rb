class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # So that CanCan works with a hash already cleaned up by strong parameters
  before_filter do
    # Get a symbol for the name of the resource from the controller name
    resource = controller_path.singularize.gsub('/', '_').to_sym

    # Determine the name of the strong parameters method
    method = "#{resource}_params"

    # Use the hash from strong parameters if its set up
    params[resource] &&= send(method) if respond_to?(method, true)
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

end
