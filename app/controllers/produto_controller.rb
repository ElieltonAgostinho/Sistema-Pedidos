class ProdutoController < ApplicationController
  
  def index
  	if session[:cliente].nil? == true || session[:cliente] == '' then
  		redirect_to '/login/'
    else
      @cliente = Cliente.find(session[:cliente])


      @nome = @cliente.nome
  	end
  end

  def create
  	
  	@nome = params['nome']
  	@valor = params['valor']

  	@buscaProduto = Produto.find_by nome: @nome

  	@resposta = ''

  	if @buscaProduto.nil? == true then
  		Produto.create(:nome => @nome, :valor => @valor)
  		@resposta = '<div class="alert alert-success" role="alert" style="width:30%;margin-left:35%;">Produto Cadastrado Com Sucesso!</div>'
  	else
  		@resposta = '<div class="alert alert-warning" role="alert" style="width:30%;margin-left:35%;">Produto Já Existe!</div>'
  		
  	end

  	@retorno = @resposta.html_safe


  	render '/produto/index'

  end

end
