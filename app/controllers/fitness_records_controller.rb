class FitnessRecordsController < ApplicationController
  def index
    @fitnessRecords = FitnessRecord.all
  end

  def create
    @record = FitnessRecord.new(fitness_record_params)
    if @record
      @record.save
      flash[:success] = "成功新增锻炼记录！"
      redirect_to fitness_records_path
    else
      render fitness_records_path
    end
  end

  private

  def fitness_record_params
    params.require(:record).permit(:title, :content)
  end
end