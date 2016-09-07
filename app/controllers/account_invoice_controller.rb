class AccountInvoiceController < ApplicationController
  ## Example to show how to set a class variable
  # OdooConnect.class_variable_set(:@@table, 'account.invoice')

  def connect
    OdooConnect.new('account.invoice')
  end

  def test_form
    # Test Form for Create, Open, Paid, Cancel, Reset
    @account_invoice = AccountInvoice.all
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

  def _process_invoice(id, new_state, allow_states)
    @odoo = connect()
    ori_data = eval(@odoo.read(id))
    if allow_states.index ori_data[:state]
      data = @odoo.update(id, {state: new_state})
    else
      data = "Fail to #{new_state} a non-#{allow_states} invoice, id: #{id}"
    end
  end

  def open
    @data = _process_invoice(params[:id].to_i, "open", ["draft"])
    render :plain => @data
  end

  def paid
    @data = _process_invoice(params[:id].to_i, "paid", ["open"])
    render :plain => @data
  end

  def cancel
    @data = _process_invoice(params[:id].to_i, "cancel", ["draft", "open"])
    render :plain => @data
  end

  def reset
    @data = _process_invoice(params[:id].to_i, "draft", ["cancel"])
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

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def account_invoice_params
      params.require(:account_invoice).permit(:image)
    end

end
