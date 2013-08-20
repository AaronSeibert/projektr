class CreateScreenshots < ActiveRecord::Migration
  def change
    create_table :screenshots do |t|
      t.string :name,      :null => false
      t.binary :data,      :null => false
      t.string :filename
      t.string :mime_type
      t.references :revision

      t.timestamps
    end
  end
  
  def self.down
    drop_table :screenshots
  end
end
