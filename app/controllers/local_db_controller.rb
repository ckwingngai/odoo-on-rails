class LocalDbController < ApplicationController

  def get_all_id
    @limit = params[:limit].to_i
    @limit = $api_limit if @limit.nil? || @limit == 0
    @table_name = params[:local_table].camelize.constantize
    @data = @table_name.select(:id).limit(@limit).to_json
    render :plain => @data
  end

  def get_all
    @limit = params[:limit].to_i
    @limit = $api_limit if @limit.nil? || @limit == 0
    @table_name = params[:local_table].camelize.constantize
    @data = @table_name.limit(@limit).to_json
    render :plain => @data
  end

  def get_one
    @id = params[:id]
    @table_name = params[:local_table].camelize.constantize
    @data = @table_name.find(@id).to_json
    render :plain => @data
  end

end
