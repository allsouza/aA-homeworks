class ChangeToys < ActiveRecord::Migration[5.1]
  def change
    drop_table :toys

    create_table :toys do |t|
      t.references :toyable_id, polymorphic: true, index: true
      t.timestamps
    end
  end
end
