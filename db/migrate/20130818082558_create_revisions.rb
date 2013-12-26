class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.text :name
      t.references :project

      t.timestamps
    end
  end
end
