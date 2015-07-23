get '/cards/spread' do
  @spread = Spread.first.deal

  erb :'spread/show'
end

get '/cards/:id' do
  if params[:id] == 'random'
    @card = Card.all.sample
  else
    @card = Card.find(params[:id])
  end

  erb :'cards/show'
end
