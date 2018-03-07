class AddFkeyToFitnessRecords < ActiveRecord::Migration[5.0]
  def change
    add_reference(:fitness_records, :user)
  end
end
