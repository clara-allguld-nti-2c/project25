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

get('/apple') do
    "
    <h1>ÄÄÄÄÄPPPPPLEEEEEEEEEE</h1>
    <img src= 'https://images.squarespace-cdn.com/content/v1/5bd6c248d74562c103550911/1600937822168-4WZTG741I86XO4KM19CF/image-asset.jpeg' style='width:500px;'>
    <br>
    äppelsaker:
    <ul>
    <li>äppeljos</li>
    <li>äppelpaj</li>
    <li>äppelmos</li>
    </ul>
    <a href='/'>Tillbaka till startsidan!</a>
    "

end

get('/paron') do
    "
    <h1>päron.</h1>
    <img src= 'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/benefits-of-pears-1296x728-feature.jpg?w=1155&h=1528' style='width:500px;'>
    <br>
    päronsaker:
    <ul>
    <li>päronfestis</li>
    <li>piggelin</li>
    <li>päronmarmelad</li>
    </ul>
    <a href='/'>Tillbaka till startsidan!</a>
    "

end

get('/fruits/:horse/:taste') do
    data = params[:horse]
    data = params[:taste]

    return "Du äter #{data} och den smakar #{taste}"
end

get('/music/:music_id') do
	list = ["pop", "rock", "rnb", "rap"]
	music_id = params[:music_id].to_i

	response = list[music_id]

	return response
end