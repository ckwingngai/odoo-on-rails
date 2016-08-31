class ResPartnerController < ApplicationController
  @@odoo = OdooConnect.new('res.partner')

  def get_fields
    @data = @@odoo.fields_get
    render :text => @data
  end

  def get_all_id
    @limit = params[:limit].to_i
    @data = @@odoo.search([], 0, @limit)
    render :text => @data
  end

  def get_all
    @limit = params[:limit].to_i
    @data = @@odoo.search_read(@limit)
    render :text => @data
  end

  def get_one
    @id = params[:id].to_i
    @data = @@odoo.read(@id)
    render :text => @data
  end

end
