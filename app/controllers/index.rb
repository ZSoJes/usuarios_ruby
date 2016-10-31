before '/users/:id' do
  if session[:user_id] == nil
    redirect to '/?error=true'
  end
end

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
  if params[:error] == true
    @error = "no puedes acceder esta session"
  end

  erb :index
end


post '/log_in' do
  @a = params[:email] 
  @b = params[:pass]
  @user = User.authenticate(@a, @b)

  if @user != nil
    session[:user_id] = @user.id
    redirect to "/users/#{@user.id}"
  else
    redirect to '/log_out'
  end
end

get '/users/:id' do
  erb :log_in
end


# get '/log_in' do
#   if session[:user_id] != nil
#     erb :log_in
#   else
#     erb :error
#   end
# end

# get '/log_in/:user_id' do
  
#   exite = User.find_by(id: params[:user_id])
#   if exite != nil
#     erb :error_2
#   end

# end

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
  erb :error_2
 else    
  puts "agregado satisfactoriamente"
  redirect to('/')
end


end