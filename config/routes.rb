Rails.application.routes.draw do

  # General
  get 'api/:table/get_fields/' => 'odoo#get_fields'
  get 'api/:table/get_all_id/(:limit)' => 'odoo#get_all_id'
  get 'api/:table/get_all/(:limit)' => 'odoo#get_all'
  get 'api/:table/get_one/:id' => 'odoo#get_one'

  # Account - Invoice (account_invoice)
  get 'account_invoice/test_form' => 'account_invoice#test_form'
  post 'api/account_invoice/create/' => 'account_invoice#create'
  post 'api/account_invoice/open/' => 'account_invoice#open'
  post 'api/account_invoice/paid/' => 'account_invoice#paid'
  post 'api/account_invoice/cancel/' => 'account_invoice#cancel'
  post 'api/account_invoice/reset/' => 'account_invoice#reset'
  post 'api/account_invoice/add/' => 'account_invoice#add'
  get 'test_method' => 'account_invoice#test_method'

  # Invoice - Line (account_invoice_line)
  post 'api/account_invoice_line/add/' => 'account_invoice_line#add'

  # Res - Users (res_users)
  get 'res_users/test_form' => 'res_users#test_form'
  post 'api/res_users/create/' => 'res_users#create'
  post 'api/res_users/change_password/' => 'res_users#change_password'

  # Res - Groups (res_groups)

  # Res - Partner (res_partner)
  get 'res_partner/test_form' => 'res_partner#test_form'
  post 'api/res_partner/create/' => 'res_partner#create'

  # upload file
  resources :uploads
  get 'post' => 'uploads#post'
end
