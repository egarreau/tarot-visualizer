get '/cards/:id' do
  if params[:id] == 'random'
    @card = Card.all.sample
  else
    @card = Card.find(params[:id])
  end

  erb :'cards/show'
end
