class HomeController < ApplicationController
  def index

  	if session[:cliente].nil? == true || session[:cliente] == '' then
  		redirect_to '/login/'
  	else
		
  		@cliente = Cliente.find(session[:cliente])


  		@nome = @cliente.nome
  		@tr = ''

  		@pedidos = Pedido.first
 		

  		if @pedidos.nil? == true then
  		
  			@tr = '<tr><th colspan="5" style="text-align: center;">Nenhum Pedido Encontrado!</th></tr>'
  			
  		else

  			@query = Pedido.select(:numero_pedido,:clientes_id,:valor_total,:data_hora).distinct

  			@query.each do |pedido|
  				@clienteNome = Cliente.find(pedido.clientes_id)
		        @tr += '<tr><th>'+pedido.numero_pedido.to_s+'</th>
  					<th>'+@clienteNome.nome.to_s+'</th>
  					<th>'+pedido.valor_total.to_s+'</th>
  					<th>'+pedido.data_hora.to_s+'</th>
  					<th>
  					<button type="button" class="btn btn-primary btnDetalhes" data-pedido="'+pedido.numero_pedido.to_s+'" data-bs-toggle="modal" data-bs-target="#exampleModal" >Detalhes</button>
  					</th></tr>'
		    end

  		end

  		@linhas = @tr.html_safe
  		

  		#@pedidos = '<th>Número do Pedido</th><th>Cliente</th><th>alor Total</th><th>Data</th><th><button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">Detalhes</button></th>'
  		#@sempedidos = '<tr><th colspan="5" style="text-align: center;">texto texto</th></tr>'

  	end

  end


  def show
    @id = params['id']

    @query = Listagem.all

    #
    @retorno = []

    @query.each do |pedidos|
      
      if pedidos.numero_pedido == @id.to_i then
        
        @queryProduto = Produto.find(pedidos.produtos_id)
        @retorno.push(@queryProduto) 
      end
      
      
    end
    
    render json: @retorno
    
  end

end
