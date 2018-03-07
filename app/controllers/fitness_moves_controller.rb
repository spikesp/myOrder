class FitnessMovesController < ApplicationController
  def create
    @move = FitnessMove.new(fitness_move_params)
    if @move
      @move.fitness_record_id = params[:fitness_record_id]
      @move.save
      flash[:success] = "成功添加锻炼动作！"
      redirect_to fitness_record_path(params[:fitness_record_id])
    else
      render fitness_records_path
    end
  end

  def show
    @record = FitnessRecord.find_by(:id => params[:fitness_record_id])
    @move = FitnessMove.find_by(:id => params[:id])
  end

  def new
    @record = FitnessRecord.find_by(:id => params[:fitness_record_id])
    @move = FitnessMove.find_by(:id => params[:id])
  end

  def edit
    @record = FitnessRecord.find_by(:id => params[:fitness_record_id])
    @move = FitnessMove.find_by(:id => params[:id])
  end

  def update
    @move = FitnessMove.find_by(:id => params[:id])
    @move.update({:name => params[:fitness_move][:name], :weight => params[:fitness_move][:weight], :times => params[:fitness_move][:times]})
    redirect_to fitness_record_path(params[:fitness_record_id])
  end

  def destroy
    @move = FitnessMove.find_by(:id => params[:id])
    if @move
      @move.destroy
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def fitness_move_params
    params.require(:move).permit(:name, :weight, :times)
  end
end