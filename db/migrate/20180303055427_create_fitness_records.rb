class CreateFitnessRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :fitness_records do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
