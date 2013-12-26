class AddImageToScreenshots < ActiveRecord::Migration
  def change
    add_column :screenshots, :image, :string
  end
end
