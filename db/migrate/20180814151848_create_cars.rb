class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.integer :mileage
      t.integer :cylinders
      t.integer :liters
      t.string :drive
      t.string :make
      t.string :model
      t.string :trany
      t.integer :year

      t.timestamps
    end
  end
end
