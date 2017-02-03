class CreateNames < ActiveRecord::Migration[5.0]
  def change
    create_table :names do |t|
      t.string :author
      t.string :description
      t.integer :edition
      t.boolean :available, default: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
