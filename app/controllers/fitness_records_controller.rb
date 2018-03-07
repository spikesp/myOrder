class FitnessRecordsController < ApplicationController
  def index
    @fitnessRecords = FitnessRecord.all
  end

  def show
    @record = FitnessRecord.find_by(:id => params[:id])
  end

  def new
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

  def edit
    @record = FitnessRecord.find_by(:id => params[:id])
  end

  def update
    @record = FitnessRecord.find_by(:id => params[:id])
    @record.update({:title => params[:fitness_record][:title], :content => params[:fitness_record][:content]})
    redirect_to fitness_records_path
  end

  def destroy
    @record = FitnessRecord.find_by(:id => params[:id])
    if @record
      @record.destroy
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