class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.boolean :blocked, default: false
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
