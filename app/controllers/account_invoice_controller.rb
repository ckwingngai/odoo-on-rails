require "xmlrpc/client"

class AccountInvoiceController < ApplicationController
  ## Example to show how to set a class variable
  # OdooConnect.class_variable_set(:@@table, @@table)
  @@odoo = OdooConnect.new('account.invoice')

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
    @isValid = Validation.new.process([{data: @id, type: Integer}], [])
    @data = Validation.return(@isValid, @@odoo.read(@id))
    render :plain => @data
  end

  def test_form

  end

  def create
    @partner_id = params[:partner_id].to_i
    @data = @@odoo.create({partner_id: @partner_id})
    render :plain => @data
  end

  def open
    @data = @@odoo.update(params[:id].to_i, {state: "open"})
    render :plain => @data
  end

  def paid
    @data = @@odoo.update(params[:id].to_i, {state: "paid"})
    render :plain => @data
  end

  def cancel
    @data = @@odoo.update(params[:id].to_i, {state: "cancel"})
    render :plain => @data
  end

  def reset
    @data = @@odoo.update(params[:id].to_i, {state: "draft"})
    render :plain => @data
  end

end
