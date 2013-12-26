class RemoveFieldsFromScreenshots < ActiveRecord::Migration
  def change
    remove_column :screenshots, :data, :binary
    remove_column :screenshots, :filename, :string
    remove_column :screenshots, :mime_type, :string
  end
end
