class OdooController < ApplicationController
  # OdooConnect.class_variable_set(:@@table, 'res.groups')

  def create_db
    @odoo = connect()
    @params = {
      'name' => params[:name],
      'login' => params[:login],
      'password' => params[:password],
      'lang' => params[:lang],
      'country_code' => params[:country_code]
    }
    @data = @odoo.create_db(@params)
    render :plain => @data
  end

  def test_form
    # Test Form for Create DB
  end

  def get_table
    @path_arr = request.env['PATH_INFO'].split("/")
    @path_arr[2].gsub('_', '.')
  end

  def get_rails_class(table)
    @table_arr = table.split('.')
    @class = @table_arr.map(&:capitalize).join
  end

  def connect
    @table = get_table()
    OdooConnect.new(@table)
  end

  def get_fields
    @odoo = connect()
    @data = @odoo.fields_get
    render :plain => @data
  end

  def get_all_id
    @odoo = connect()
    @limit = params[:limit].to_i
    @limit = $api_limit if @limit.nil? || @limit == 0
    @data = @odoo.search([], 0, @limit)
    render :plain => @data
  end

  def get_all
    @odoo = connect()
    @limit = params[:limit].to_i
    @limit = $api_limit if @limit.nil? || @limit == 0
    @data = @odoo.search_read(@limit)
    render :plain => @data
  end

  def get_one
    @odoo = connect()
    @id = params[:id].to_i
    @data = @odoo.read(@id)
    render :plain => @data
  end

end
