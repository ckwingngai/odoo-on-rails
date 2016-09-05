class AccountInvoiceLineController < ApplicationController

  def connect
    OdooConnect.new('account.invoice.line')
  end

end
