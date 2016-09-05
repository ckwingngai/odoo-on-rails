class ResPartnerController < ApplicationController

  def connect
    OdooConnect.new('res.partner')
  end

  def create
    @odoo = connect()
    @name = params[:name]
    @data = @odoo.create({name: @name})
    render :plain => @data
  end

end
