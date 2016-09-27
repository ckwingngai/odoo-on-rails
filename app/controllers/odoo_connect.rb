require "xmlrpc/client"
# master_pwd:softpub!@#
# name:tommy_test_1
# login:info@listenfinancial.com
# password:123456
# lang:en_US
# country_code:hk

$master_pwd = "softpub!@#"
$url = "http://demo.3acct.com:8069"
$db = "test_db2"
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

  def create_db(params)
    uri = URI("#{$url}/web/database/create")
    # request = Net::HTTP::Post.new(uri)
    # # request.read_timeout = 5000
    # # puts "request.read_timeout: #{request.read_timeout}"
    # res = Net::HTTP.post_form(uri,
    #   'master_pwd' => $master_pwd,
    #   'name' => 'raymond_test',
    #   'login' => 'raymond@test.com',
    #   'password' => '123456',
    #   'lang' => 'en_US',
    #   'country_code' => 'hk'
    # )
    clnt = HTTPClient.new
    clnt.receive_timeout = 10000
    body = {
      'master_pwd' => $master_pwd,
      'name' => params['name'],
      'login' => params['login'],
      'password' => params['password'],
      'lang' => params['lang'],
      'country_code' => params['country_code']
    }
    res = clnt.post(uri, body)
    new_company = Company.create({name: body["name"], lang: body["lang"], country_code: body["country_code"]})
    new_company.save

    return res.body
  end

  def method_call
    # puts "method_call #{@@table}"
    # $models.execute_kw($db, $uid, $password,
    #     @@table, 'check_access_rights',
    #     ['read'], {raise_exception: false})
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
    backup(@new_id, 'create', obj)
  end

  def update(id, obj)
    puts "id: #{id}, obj: #{obj}"
    $models.execute_kw($db, $uid, $password, @@table, 'write', [[id], obj])
    backup(id, 'update', obj)
  end

  def backup(id, action, obj)
    @RubyClass = OdooController.new.get_rails_class(@@table).constantize
    local_db = @RubyClass.create({db: $db, ref_id: id, action: action, post_json: obj.to_json})
    if local_db.save
      return "ID:#{id} is triggered with #{obj} in local id #{local_db.id}"
    else
      return "false to save"
    end
  end

end
