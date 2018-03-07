class FitnessRecordsController < ApplicationController
  before_action :authenticate_user!
  def index
    @fitnessRecords = User.find_by(:id => current_user.id).fitness_records
  end

  def show
    @record = FitnessRecord.find_by(:id => params[:id])
  end

  def new
  end

  def create
    @record = FitnessRecord.new(fitness_record_params)
    if @record
      @record.user_id = current_user.id
      @record.save
      # binding.pry
      flash[:note] = "成功新增锻炼记录！"
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