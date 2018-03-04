class CreateFitnessMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :fitness_moves do |t|
      t.string :name
      t.string :weight
      t.integer :times
      t.timestamps
    end
  end
end
