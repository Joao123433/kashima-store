class InicioController < ApplicationController
  before_action :index
  def index
    @clotings = Clothing.all
  end

  def compra
    @compra = Clothing.find(params[:escolha])
    @proximos = @clotings.reject { |p| p == @compra }
    @next = []
    0.upto(2) { @next.push(@proximos.delete_at(Random.rand(@proximos.size))) }
  end
end
