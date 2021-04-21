class LoginController < ApplicationController
  def index

  	@query = Cliente.first
  	@query2 = Login.first

    if @query.nil? == false && @query2.nil? == false 
      puts 'Cadastrar Movimentação'
      #return @query.id
  	else
  	  @cli = Cliente.create(:nome => 'Cliente Teste',:data => '1999-04-20')
      Produto.create(:nome => 'Produto Novo',:valor => 10)
  	  Login.create(:clientes_id => @cli.id,:login => 'teste.teste', :senha => '123456')
    end

  end

  def create
  	@login = params['login']
  	@senha = params['senha']

  	
  	@query = Login.find_by login: @login, senha: @senha
  	
  	if @query.nil? == false then

  		session[:errorLogin] = nil

  		session[:cliente] = @query.clientes_id

  		redirect_to '/home/'

  	else

  		session[:errorLogin] = 'Não foi encontrado usuário com essas informações!'
  		redirect_to '/login/'
  	 	
  	end 

  	


  end

end
