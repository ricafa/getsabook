class CreateRents < ActiveRecord::Migration[5.0]
  def change
    create_table :rents do |t|
      t.references :student, foreign_key: true
      t.references :book, foreign_key: true
      t.boolean :returned, default: false
      t.date :bring_back
      t.text :obs

      t.timestamps
    end
  end
end
