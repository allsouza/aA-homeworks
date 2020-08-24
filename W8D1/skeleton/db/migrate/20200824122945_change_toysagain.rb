class ChangeToysagain < ActiveRecord::Migration[5.1]
  def change
    drop_table :toys

    create_table :toys do |t|
      t.references :toyable_id, polymorphic: true, index: true
      t.integer :toyable_id
      t.string :name, null: false, index: true
      t.string :toyable_type
      t.timestamps
    end

    add_index :toys, [:name, :toyable_id, :toyable_type], unique: true
  end
end
