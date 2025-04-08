require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
require 'bcrypt'

enable :sessions

get('/') do
    
    slim(:register)

end 

get('/statisk') do
    send_file 'public/index.html' 
end

get('/login') do
   slim(:login)
end

post('/login') do
    username = params[:username]
    password = params[:password] 
    db = SQLite3::Database.new('db/db.db')
    db.results_as_hash = true 
    result = db.execute("SELECT * FROM users WHERE username = ?", [username]).first
    pwdigest = result["pwdigest"]
    id = result["id"]
    session[:username] = username
  
  
    if BCrypt::Password.new(pwdigest) == password 
      session[:id] = id
      redirect('/profile')
    else
      "FEL LÖSEN!"
    end
  
end

post('/users/new') do 
    username = params[:username]
    password = params[:password]
    password_confirm = params[:password_confirm]
    session[:username] = username

    if (password == password_confirm)
      password_digest = BCrypt::Password.create(password)
      db = SQLite3::Database.new('db/db.db')
      db.results_as_hash = true 
      db.execute('INSERT INTO users (username,pwdigest) VALUES (?,?)',[username,password_digest])
      result = db.execute("SELECT * FROM users WHERE username = ?", [username]).first
      id = result["id"]
      session[:id] = id
      redirect('/profile')
    else
      "Lösenorden matchade inte"
    end
end


get('/profile') do
    db = SQLite3::Database.new('db/db.db')
    db.results_as_hash = true 
    users = db.execute("SELECT * FROM users")
    slim(:profile,locals:{users:users})
end

get('/mywardrobe') do
    "
    <h1>dina kläder</h1>
    tröjor:
    <ul>
      <li>tröja1<li/>
      <li>tröja2<li/>
      <li>tröja3<li/>
    <ul/>

    byxor:
    <ul>
      <li>byxa1<li/>
      <li>byxa2<li/>
      <li>byxa3<li/>
    <ul/>

    skor:
    <ul>
      <li>skor1<li/>
      <li>skor2<li/>
      <li>skor3<li/>
    <ul/>
    
    <a href='/'>Tillbaka till startsidan!</a>
    "

end

get('/myoutfits') do
    "
    <h1>dina outfits.</h1>
  
  
    <a href='/'>Tillbaka till startsidan!</a>
    "

end


get('/music/:music_id') do
	list = ["pop", "rock", "rnb", "rap"]
	music_id = params[:music_id].to_i

	response = list[music_id]

	return response
end