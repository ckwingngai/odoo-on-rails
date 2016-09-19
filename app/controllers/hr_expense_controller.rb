class HrExpenseController < ApplicationController
  # OdooConnect.class_variable_set(:@@table, 'res.groups')

  def connect
    OdooConnect.new('hr.expense')
  end

  def test_form
  end

  def create
    @odoo = connect()
    @obj = {
      employee_id: params[:employee_id],
      name: params[:name],
      product_id: params[:product_id].to_i,
      unit_amount: params[:unit_amount].to_i,
      # analytic_account_id: false,
      # bank_journal_id: 6,
      # company_id: 1,
      # currency_id: 25,
      # date: "2016-09-19",
      # department_id: false,
      # description: false,
      # journal_id:2,
      # message_follower_ids:false,
      # message_ids:false,
      # payment_mode:"own_account",
      # product_uom_id: 1,
      # quantity: 1,
      # tax_ids: [[6, false, [5]]],
    }
    @data = @odoo.create(@obj)
    render :plain => @data
  end

  def _process_invoice(id, new_state, allow_states)
    @odoo = connect()
    ori_data = eval(@odoo.read(id))
    if allow_states.index ori_data[:state]
      data = @odoo.update(id, new_state)
    else
      data = "Fail to #{new_state} a non-#{allow_states} invoice, id: #{id}"
    end
  end

  def submit
    @data = _process_invoice(params[:id].to_i, {state: "submit"}, ["draft"])
    render :plain => @data
  end

  def approve
    @data = _process_invoice(params[:id].to_i, {state: "approve"}, ["submit"])
    render :plain => @data
  end

  def post
    @data = _process_invoice(params[:id].to_i, {state: "post"}, ["approve"])
    render :plain => @data
  end

  def done
    @data = _process_invoice(params[:id].to_i, {state: "done"}, ["post"])
    render :plain => @data
  end

  def cancel
    @data = _process_invoice(params[:id].to_i, {state: "cancel"}, ["draft"])
    render :plain => @data
  end

end
