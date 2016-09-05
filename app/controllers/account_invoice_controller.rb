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
    @data = @odoo.create({partner_id: @partner_id,
      invoice_line_ids: [[0, false,
        {
          # "account_analytic_id": false,
          # "discount": 0,
          # "invoice_line_tax_ids": [],
          # "sequence": 10,
          "account_id": params[:account_id].to_i,
          "name": params[:name],
          "price_unit": params[:price_unit].to_i,
          "product_id": params[:product_id].to_i,
          "quantity": params[:quantity].to_i,
          "uom_id": params[:uom_id].to_i
        }
      ]]
    })
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

  # "invoice_line_ids": [0, false, {
  #   "account_analytic_id": false,
  #   "account_id": 17,
  #   "discount": 0,
  #   "invoice_line_tax_ids": [],
  #   "name": "Ruler",
  #   "price_unit": 1,
  #   "product_id": 3,
  #   "quantity": 1,
  #   "sequence": 10,
  #   "uom_id": 1
  # }]

  def add
    @odoo = connect()
    puts params[:id].to_i
    @data = @odoo.update(params[:id].to_i, {
      invoice_line_ids: [[0, false,
        {
          # "account_analytic_id": false,
          # "discount": 0,
          # "invoice_line_tax_ids": [],
          # "sequence": 10,
          "account_id": params[:account_id].to_i,
          "name": params[:name],
          "price_unit": params[:price_unit].to_i,
          "product_id": params[:product_id].to_i,
          "quantity": params[:quantity].to_i,
          "uom_id": params[:uom_id].to_i
        }
      ]]
    })
    render :plain => @data
  end

end
