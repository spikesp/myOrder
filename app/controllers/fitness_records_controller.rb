class FitnessRecordsController < ApplicationController
  def index
    @fitnessRecords = FitnessRecord.all
    @fitnessMoves = FitnessMove.all
  end
end