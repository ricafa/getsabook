class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.references :student
      t.references :book
      t.boolean :returned, default: false
      t.date :bring_back
      t.text :obs

      t.timestamps
    end
  end
end
