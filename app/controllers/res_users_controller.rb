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
    puts "change_password #{params[:id]} #{params[:password]}"
    @data = @odoo.update(params[:id].to_i, {password: params[:password]})
    render :plain => @data
  end

end
