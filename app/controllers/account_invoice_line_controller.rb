class AccountInvoiceLineController < ApplicationController

  def connect
    OdooConnect.new('account.invoice.line')
  end

  def add
    @odoo = connect()
    # @data = @odoo.create(params[:id].to_i, {: "draft"})

    # @invoice_line_ids = eval(@odoo.read(@id))[:invoice_line_ids]
    # @invoice_line_ids.push(@item)

    # @odoo = connect()
    # @id = params[:id].to_i
    # @item = params[:item].to_i
    #
    # invoice_line_ids
    @data = @odoo.create({product_id: 3, invoice_id: 65, uom_id: 1, account_id: 17})
    render :plain => @data
  end

end
