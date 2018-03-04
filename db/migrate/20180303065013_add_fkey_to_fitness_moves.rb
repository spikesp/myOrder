class AddFkeyToFitnessMoves < ActiveRecord::Migration[5.0]
  def change
    add_reference(:fitness_moves, :fitness_record)
  end
end
