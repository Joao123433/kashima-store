class InicioController < ApplicationController
  before_action :index
  before_action :carrinho
  layout 'secondApplication', only: %i[compra carrinho]

  def index
    @clotings = Clothing.all
  end

  def compra
    @compra = Clothing.all.find(params[:escolha])
    @proximos = @clotings.reject { |p| p == @compra }
    if @proximos.size > 2
      @next = []
      0.upto(2) { @next.push(@proximos.delete_at(Random.rand(@proximos.size))) }
    elsif @proximos.size > 1
      @next = []
      0.upto(1) { @next.push(@proximos.delete_at(Random.rand(@proximos.size))) }
    end
  end

  def carrinho
    @cart_items = session[:cart] || []
  end

  def adicionar_ao_carrinho
    @compra = Clothing.find(params['id'])
    @cart_items = session[:cart] || []
    @size = params[:size]

    existing_item = @cart_items.find { |item| item['product_name'] == @compra.label && item['size'] == @size }

    if existing_item
      existing_item['quantity'] += 1
    else
      item_uuid = SecureRandom.uuid
      @cart_items << { id: item_uuid, product_name: @compra.label, price: @compra.price, size: @size, path: @compra.path, quantity: 1}
    end

    session[:cart] = @cart_items
    redirect_to inicio_carrinho_path, notice: 'Item adicionado ao carrinho com sucesso.'
  end

  def remover_do_carrinho
    @cart_items = session[:cart] || []
    item_id = params['id']

    removing_item = @cart_items.find { |item| item['id'] == item_id }

    if removing_item['quantity'] > 1
      removing_item['quantity'] -= 1
    else
      @cart_items.delete_if { |item| item['id'] == item_id }
      session[:cart] = @cart_items
    end

    respond_to do |format|
      format.html { redirect_to inicio_carrinho_path, notice: 'Item removido do carrinho com sucesso.' }
      format.json { head :no_content }
    end
  end

  def informacao; end
end
