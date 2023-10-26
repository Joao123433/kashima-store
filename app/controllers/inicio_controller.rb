class InicioController < ApplicationController
  before_action :index
  layout 'secondApplication', only: %i[compra carrinho]

  def index
    @clotings = Clothing.all
  end

  def compra
    @compra = Clothing.find(params[:escolha])
    @proximos = @clotings.reject { |p| p == @compra }
    @next = []
    0.upto(2) { @next.push(@proximos.delete_at(Random.rand(@proximos.size))) }
  end

  def carrinho
    @cart_items = session[:cart] || []
  end

  def adicionar_ao_carrinho
    @compra = Clothing.find(params['id'])
    @cart_items = session[:cart] || []

    item_uuid = SecureRandom.uuid
    @cart_items << { id: item_uuid, product_name: @compra.label, price: @compra.price, path: @compra.path, quantity: 1 }  
    session[:cart] = @cart_items
    redirect_to inicio_carrinho_path, notice: 'Item adicionado ao carrinho com sucesso.'
  end

  def remover_do_carrinho
    @cart_items = session[:cart] || []
    item_id = params['id']

    @cart_items.delete_if { |item| item['id'] == item_id }
    session[:cart] = @cart_items

    respond_to do |format|
      format.html { redirect_to inicio_carrinho_path, notice: 'Item removido do carrinho com sucesso.' }
      format.json { head :no_content }
    end
  end

  def informacao; end
end
