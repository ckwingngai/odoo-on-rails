Rails.application.routes.draw do

  # General
  get 'api/:table/get_fields/' => 'odoo#get_fields'
  get 'api/:table/get_all_id/(:limit)' => 'odoo#get_all_id'
  get 'api/:table/get_all/(:limit)' => 'odoo#get_all'
  get 'api/:table/get_one/:id' => 'odoo#get_one'

  # Account - Invoice
  get 'api/account_invoice/get_fields/' => 'account_invoice#get_fields'
  get 'api/account_invoice/get_all_id/(:limit)' => 'account_invoice#get_all_id'
  get 'api/account_invoice/get_all/(:limit)' => 'account_invoice#get_all'
  get 'api/account_invoice/get_one/:id' => 'account_invoice#get_one'
  get 'account_invoice/test_form' => 'account_invoice#test_form'
  post 'api/account_invoice/create/' => 'account_invoice#create'
  post 'api/account_invoice/open/' => 'account_invoice#open'
  post 'api/account_invoice/paid/' => 'account_invoice#paid'
  post 'api/account_invoice/cancel/' => 'account_invoice#cancel'
  post 'api/account_invoice/reset/' => 'account_invoice#reset'
  post 'api/account_invoice/add/' => 'account_invoice#add'
  get 'test_method' => 'account_invoice#test_method'

  # Invoice - Line
  get 'api/invoice_line/get_fields/' => 'invoice_line#get_fields'
  get 'api/invoice_line/get_all_id/(:limit)' => 'invoice_line#get_all_id'
  get 'api/invoice_line/get_all/(:limit)' => 'invoice_line#get_all'
  get 'api/invoice_line/get_one/:id' => 'invoice_line#get_one'

  # Res - Users
  get 'api/res_users/get_fields/' => 'res_users#get_fields'
  get 'api/res_users/get_all_id/(:limit)' => 'res_users#get_all_id'
  get 'api/res_users/get_all/(:limit)' => 'res_users#get_all'
  get 'api/res_users/get_one/:id' => 'res_users#get_one'
  get 'res_users/test_form' => 'res_users#test_form'
  post 'api/res_users/create/' => 'res_users#create'
  post 'api/res_users/change_password/' => 'res_users#change_password'

  # Res - Groups
  get 'api/res_groups/get_fields/' => 'res_groups#get_fields'
  get 'api/res_groups/get_all_id/(:limit)' => 'res_groups#get_all_id'
  get 'api/res_groups/get_all/(:limit)' => 'res_groups#get_all'
  get 'api/res_groups/get_one/:id' => 'res_groups#get_one'

  # Res - Partner
  get 'api/res_partner/get_fields/' => 'res_partner#get_fields'
  get 'api/res_partner/get_all_id/(:limit)' => 'res_partner#get_all_id'
  get 'api/res_partner/get_all/(:limit)' => 'res_partner#get_all'
  get 'api/res_partner/get_one/:id' => 'res_partner#get_one'
  get 'res_partner/test_form' => 'res_partner#test_form'
  post 'api/res_partner/create/' => 'res_partner#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
