before '/users/:id' do
  if session[:user_id] == nil
    redirect to '/?error=true'
  end
end

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  if params[:error] == 'true'
    @error = "El acceso ha fallado, rectifique su correo y/o contraseña"
  end

  erb :index
end


post '/log_in' do
  @a = params[:email] 
  @b = params[:pass]
  @user = User.authenticate(@a, @b)

  if @user != nil
    session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"      # evaluar si redirigir a la sesion 
  else                                    # o salir de la sesion

    redirect to '/?error=true'
  end
end

get '/users/:id' do     # muestra un especifico usuario por su id
  erb :log_in
end

get '/log_out' do
  @current_user = session[:user_id] = nil
  redirect to '/'
end


get '/create_user' do   # re dirigue a la pagina dentro de index
  @error
    erb :create_user
end

post '/create_user' do  # permite trabajar con los datos dentro de create_user
  nuev_name = params[:name] 
  nuev_mail = params[:email]
  nuev_pass = params[:pass]

 usuario = User.create(name: nuev_name, password: nuev_pass, email: nuev_mail).valid?
 
 unless usuario
  erb :error
 else    
  puts "agregado satisfactoriamente"
  redirect to('/')
end


end