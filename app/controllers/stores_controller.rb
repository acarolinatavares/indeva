class StoresController < ApplicationController
  load_and_authorize_resource
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
  end

  def show
  end

  def new
    @store = Store.new
  end

  def edit
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      current_owner.add_role :admin, @store
      flash[:notice] = 'Loja criada com sucesso.'
      redirect_to @store
    else
      flash[:notice] = 'Erro ao cadastrar a loja. Verifique se todos os campos foram preenchidos, e se pelo menos um funcionário foi vinculado à loja.'
      render :new
    end
  end

  def update
    if @store.update(store_params)
      flash[:notice] = 'Loja atualizada com sucesso.'
      redirect_to @store
    else
      flash[:notice] = 'Erro ao atualizar a loja. Verifique se todos os campos foram preenchidos, e se pelo menos um funcionário foi vinculado à loja.'
      render :edit
    end
  end

  def destroy
    @store.destroy
    flash[:notice] = 'Loja apagada.'
    redirect_to stores_url
  end

  private
  def set_store
    @store = Store.find(params[:id])
    @employees = @store.employees
    @goals = @store.goals
  end

  def store_params
    params.require(:store).permit(:name, :address, :owner_id, employees_attributes: [:id, :name, :rg, :_destroy])
  end

end
