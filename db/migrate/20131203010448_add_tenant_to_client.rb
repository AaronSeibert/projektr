class AddTenantToClient < ActiveRecord::Migration
  def change
    add_reference :clients, :tenant, index: true
  end
end
