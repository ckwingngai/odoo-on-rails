class ResGroupsController < ApplicationController
  # OdooConnect.class_variable_set(:@@table, 'res.groups')

  def connect
    OdooConnect.new('res.groups')
  end

end
