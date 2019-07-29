require 'gossip'
class ApplicationController < Sinatra::Base
	get '/' do 
	   erb :index, locals: {gossips: Gossip.all}
	 end 

	get '/gossips/new/' do 
	   erb :new_gossip
	end


	post '/gossips/new/' do
		Gossip.new(params["gossip_author"],params["gossip_content"]).save
		redirect'/'
	end

	get '/gossips/:id' do  #allows to find gossip via id
	  erb :show, locals: {find_gossip: Gossip.find(params[:id])}
	end

	 # allows editing with the formual edit.erb
  get '/gossips/:id/edit' do
    erb :edit, locals: {id: params['id'].to_i, gossips: Gossip.find(params['id'].to_i)}
  end

  # retrieve the entry in the form to update the gossip
  post '/gossips/edit/' do
    Gossip.update(params['id'].to_i,params["gossip_author"], params["gossip_content"])
    redirect '/'
  end
end

