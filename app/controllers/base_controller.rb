class BaseController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_resource, only: [:destroy, :show, :update]
  before_filter :set_default_response_format
  respond_to :json

  def index
    plural_resource_name = "@#{resource_name.pluralize}"
    resources = resource_class.where(query_params)
    instance_variable_set(plural_resource_name, resources)
    set_additional_index_resources
    respond_with instance_variable_get(plural_resource_name)
  end

  def show
   set_additional_show_resources
   respond_with get_resource
  end

  def update
    if get_resource.update(resource_params)
      set_additional_show_resources
      render :show
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end

  def create
    set_resource(resource_class.new(resource_params))
    if get_resource.save
      render :show, status: :created
    else
      render json: get_resource.errors, status: :unprocessable_entity
    end
  end

  def destroy
    get_resource.destroy
    head :no_content
  end

  private

  def get_resource
    instance_variable_get("@#{resource_name}")
  end

  def resource_params
    @resource_params ||= self.send("#{resource_name}_params")
  end

  def resource_class
    @resource_class ||= resource_name.classify.constantize
  end

  def query_params
    {}
  end

  def resource_name
    @resource_name ||= self.controller_name.singularize
  end

  def set_resource(resource = nil)
    resource ||= resource_class.find(params[:id])
    instance_variable_set("@#{resource_name}", resource)
  end

  def set_additional_index_resources
    return
  end

  def set_additional_show_resources
    return
  end

  def set_default_response_format
    request.format = :json
  end

end
