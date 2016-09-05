class AccountInvoiceController < ApplicationController
  ## Example to show how to set a class variable
  # OdooConnect.class_variable_set(:@@table, 'account.invoice')

  def connect
    OdooConnect.new('account.invoice')
  end

  def test_form
    # Test Form for Create, Open, Paid, Cancel, Reset
  end

  def create
    @odoo = connect()
    @partner_id = params[:partner_id].to_i
    @data = @odoo.create({partner_id: @partner_id})
    render :plain => @data
  end

  def open
    @odoo = connect()
    @data = @odoo.update(params[:id].to_i, {state: "open"})
    render :plain => @data
  end

  def paid
    @odoo = connect()
    @data = @odoo.update(params[:id].to_i, {state: "paid"})
    render :plain => @data
  end

  def cancel
    @odoo = connect()
    @data = @odoo.update(params[:id].to_i, {state: "cancel"})
    render :plain => @data
  end

  def reset
    @odoo = connect()
    @data = @odoo.update(params[:id].to_i, {state: "draft"})
    render :plain => @data
  end

end
