class ResUsersController < ApplicationController

  def connect
    OdooConnect.new('res.users')
  end

  def create
    @odoo = connect()
    @name = params[:name]
    @login = params[:login]
    @password = params[:password]
    @data = @odoo.create({name: @name, login: @login, password: @password})
    render :plain => @data
  end

  def change_password
    @odoo = connect()
    @data = @odoo.update(params[:id].to_i, {password: params[:password]})
    render :plain => @data
  end

  def change_app_right
    @odoo = connect()
    @data = @odoo.update(params[:id].to_i, {params[:module] => params[:position].to_i})
    render :plain => @data
  end

  def change_extra_right
    @odoo = connect()
    @right = params[:right] == 'true'
    @data = @odoo.update(params[:id].to_i, {params[:key] => @right})
    render :plain => @data
  end

end
