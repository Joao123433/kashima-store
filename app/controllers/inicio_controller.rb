class InicioController < ApplicationController
  before_action :index
  def index
    @clotings = Clothing.all
  end

  def compra
    @compra = Clothing.find(params[:escolha])
    @proximos = @clotings.reject { |p| p == @compra }
  end
end
