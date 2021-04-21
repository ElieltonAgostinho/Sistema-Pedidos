require 'securerandom'
require "time"

class PedidoController < ApplicationController
  
  def index
  	if session[:cliente].nil? == true || session[:cliente] == '' then
  		redirect_to '/login/'
  	else
  		if session[:codPedido].nil? == true || session[:codPedido] == '' then
	  		session[:codPedido] = (SecureRandom.random_number * (10**10)).round		
	  	end
      @cliente = Cliente.find(session[:cliente])


      @nome = @cliente.nome
      
	  	@produtos = Produto.all

	  	@optP = ''
	  	@produtos.each do |prod|
	  		@optP += '<option value="'+prod.id.to_s+'">'+prod.nome+'</option>'
	  	end

	  	@clientes = Cliente.all

	  	@optC = ''
	  	@clientes.each do |cli|
	  		@optC += '<option value="'+cli.id.to_s+'">'+cli.nome+'</option>'
	  	end

	  	@optCliente = @optC.html_safe

	  	@optProduto = @optP.html_safe

  	end

  	
  end

  def create
  	@numeroPedido = params['numeroPedido']
  	@produto = params['produto'] 
  	@cliente = params['cliente']

  	time = Time.now

  	@datahora = time.to_formatted_s(:db)

  	@prod = Produto.find(@produto)

  	@verificaPedido = Pedido.find_by numero_pedido: @numeroPedido


  	@r = ''
  	if @verificaPedido.nil? == true then
  		Pedido.create(:numero_pedido => @numeroPedido, :clientes_id => @cliente, :valor_total => @prod.valor, :data_hora => @datahora)
  		Listagem.create(:numero_pedido => @numeroPedido, :produtos_id => @produto, :valor_pedido => @prod.valor)

  		

  	else
  		@verificaPedido.valor_total += @prod.valor
  		@verificaPedido.save
  		Listagem.create(:numero_pedido => @numeroPedido, :produtos_id => @produto, :valor_pedido => @prod.valor)

  	end



  	render json: @prod 


  end

  def show
  	@id = params['id']

  	if @id != 'f'
  		@prod = Produto.find(@id)

  		render json: @prod
  	else
  		session[:codPedido] = nil
  		@n = 1
  		render json: @n
  	end

  	
  	
  end


end
