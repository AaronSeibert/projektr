class AddTenantToProject < ActiveRecord::Migration
  def change
    add_reference :projects, :tenant, index: true
  end
end
