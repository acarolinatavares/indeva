class GoalsController < ApplicationController
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  def index
    @goals = Goal.all
  end

  def show
  end

  def new
    @goal = Goal.new
  end

  def edit
  end

  def create
    operation = Goal::Create.call(goal_params)
    goal = operation.instance
    if goal.errors.any?
      flash[:notice] = 'Erro ao cadastrar a meta. Verifique se todos os campos foram preenchidos corretamente.'
      render :new
    else
      current_owner.add_role :admin, goal
      flash[:notice] = 'Loja criada com sucesso.'
      redirect_to goal
    end
  end

  def update
    if @goal.update(goal_params)
      flash[:notice] = 'Loja atualizada com sucesso.'
      redirect_to @goal
    else
      flash[:notice] = 'Erro ao atualizar a meta. Verifique se todos os campos foram preenchidos corretamente.'
      render :edit
    end
  end

  def destroy
    @goal.destroy
    flash[:notice] = 'Loja apagada.'
    redirect_to goals_url
  end

  private
    def set_goal
      @goal = Goal.find(params[:id])
      @goal_dates = @goal.goal_dates
    end

    def goal_params
      params.require(:goal).permit(:init_date, :end_date, :reference_month, :value, :store_id, :name)
    end
end
