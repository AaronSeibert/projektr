class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.references :tenant, index: true

      t.timestamps
    end
  end
end
