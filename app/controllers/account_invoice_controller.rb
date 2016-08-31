require "xmlrpc/client"

class AccountInvoiceController < ApplicationController
  ## Example to show how to set a class variable
  # OdooConnect.class_variable_set(:@@table, @@table)
  @@odoo = OdooConnect.new('account.invoice')

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

  def create
    @partner_id = params[:partner_id].to_i
    @data = @@odoo.create({partner_id: @partner_id})
    render :text => @data
  end

  def open
    @data = @@odoo.update(params[:id].to_i, "open")
    render :text => @data
  end

  def paid
    @data = @@odoo.update(params[:id].to_i, "paid")
    render :text => @data
  end

  def cancel
    @data = @@odoo.update(params[:id].to_i, "cancel")
    render :text => @data
  end

  def reset
    @data = @@odoo.update(params[:id].to_i, "draft")
    render :text => @data
  end

end
