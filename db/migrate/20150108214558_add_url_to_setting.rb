class AddUrlToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :URL, :string
  end
end
