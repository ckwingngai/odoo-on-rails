$url = "http://demo.3acct.com:8069"
$db = "test_db"
$username = "demo@3acct.com"
$password = "654321"
$common = XMLRPC::Client.new2("#{$url}/xmlrpc/2/common")
$uid = $common.call('authenticate', $db, $username, $password, {})
$models = XMLRPC::Client.new2("#{$url}/xmlrpc/2/object").proxy
$api_limit = 10

class OdooConnect
  def initialize(table)
    @@table = table
  end

  def fields_get
    $models.execute_kw($db, $uid, $password, @@table, 'fields_get', [], {attributes: %w(string help type)}).to_json
  end

  # params => [['is_company', '=', true], ['customer', '=', true]]
  def search(params=[], offset, limit)
    $models.execute_kw($db, $uid, $password, @@table, 'search', [params], {offset: offset, limit: limit})
  end

  def search_read(limit)
    $models.execute_kw($db, $uid, $password, @@table, 'search_read', [], {limit: limit}).to_json
  end

  def read(id)
    $models.execute_kw($db, $uid, $password, @@table, 'read', [id]).to_json
  end

  def create(obj)
    @new_id = $models.execute_kw($db, $uid, $password, @@table, 'create', [obj])
    backup(@new_id, 'create')
  end

  def update(id, obj)
    $models.execute_kw($db, $uid, $password, @@table, 'write', [[id], obj])
    backup(id, obj)
  end

  def backup(id, action)
    accountInvoice = AccountInvoice.create({ref_id: id, action: action})
    accountInvoice.save
  end

end
