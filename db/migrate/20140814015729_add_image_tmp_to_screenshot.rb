class AddImageTmpToScreenshot < ActiveRecord::Migration
  def change
    add_column :screenshots, :image_tmp, :string
  end
end
