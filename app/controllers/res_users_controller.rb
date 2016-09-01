class ResUsersController < ApplicationController
  @@odoo = OdooConnect.new('res.users')

  def get_fields
    @data = @@odoo.fields_get
    render :plain => @data
  end

  def get_all_id
    @limit = params[:limit].to_i
    @limit = $api_limit if @limit.nil? || @limit == 0
    @data = @@odoo.search([], 0, @limit)
    render :plain => @data
  end

  def get_all
    @limit = params[:limit].to_i
    @limit = $api_limit if @limit.nil? || @limit == 0
    @data = @@odoo.search_read(@limit)
    render :plain => @data
  end

  def get_one
    @id = params[:id].to_i
    @data = @@odoo.read(@id)
    render :plain => @data
  end

  def create
    @name = params[:name]
    @login = params[:login]
    @data = @@odoo.create({name: @name, login: @login})
    render :plain => @data
  end

end
