class FitnessRecord < ApplicationRecord
  has_many :fitness_moves

  def list_moves_of_current_record(record_id)
     FitnessMove.find_by(:fitness_record_id => record_id)
  end
  
end
