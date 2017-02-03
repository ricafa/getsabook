class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.string :description
      t.boolean :available, default: true
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
