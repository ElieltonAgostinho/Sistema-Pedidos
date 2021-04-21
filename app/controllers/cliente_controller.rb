class ClienteController < ApplicationController
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
  	@telefone = params['telefone']
  	@dtNascimento = params['nascimento']
  	@login = params['login']
  	@senha = params['senha']

  	@buscaCliente = Cliente.find_by nome: @nome

  	@resposta = ''

  	if @buscaCliente.nil? == true then
  		@AdicionaCliente = Cliente.create(:nome => @nome, :telefone => @telefone,:data => @dtNascimento)
  		Login.create(:clientes_id => @AdicionaCliente.id,:login => @login, :senha => @senha)
  		@resposta = '<div class="alert alert-success" role="alert" style="width:50%;margin-left:20%;">Cliente cadastrado com sucesso!</div>'
  	else
  		@resposta = '<div class="alert alert-warning" role="alert" style="width:50%;margin-left:20%;">Cliente Já Existe!</div>'
  		
  	end

  	@retorno = @resposta.html_safe


  	render '/cliente/index'

  end
end
