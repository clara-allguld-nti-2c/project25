require 'sinatra'
require 'slim'
require 'sqlite3'
require 'sinatra/reloader'
#require 'becrypt'


get('/') do
    "

    <h1>dingarderob.nu</h1>
    <h1>Startsidan :)<h1/>
    <a href='/loggain'>logga in</a>
    <br>
    <a href='/profil'>stilprofil</a>
    <br>
    <a href='/apple'></a>
    <br>
    <a href='/paron'>PÄRON</a>
    <br>
    <a href='/statisk'>tryck för att se min statiska fil!!!!!!!!!!! :)</a>
    "
    

end 

get('/statisk') do
    send_file 'public/index.html'
    
end

get('/loggain') do
    "
    <h1>BANAN WHOOHOOO</h1>
    <img src= 'https://www.extrakt.se/app/uploads/2015/09/5896136-bananer-1020x600.jpg' style='width:500px;'>
    <br>
    banansaker:
    <ul>
    <li>bananbröd</li>
    <li>banankaka</li>
    <li>skumbanan</li>
    <li>banana split</li>
    </ul>
    <a href='/'>Tillbaka till startsidan!</a>
    "

end

get('/profil') do
    "
    <h1>APELFUCKINGSIN</h1>
    <img src= 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQC7xxr3Ck9wlynIpzW1L82Vo3_s49AgLY4nAQJ6buFDvTXYFPHASA-6JKXIhTgnQaiL7g&usqp=CAU' style='width:500px;'>
    <br>
    apelsinsaker:
    <ul>
    <li>apelsinjos</li>
    <li>apelsinmarmelad</li>
    <li>aperol spritz</li>
    </ul>
    <a href='/'>Tillbaka till startsidan!</a>
    "

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