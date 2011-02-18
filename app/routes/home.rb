$count = 0
module Home
  get '/:document' do 
    raise "the requested document does not exist yet" if params['document'].to_i > $count
    response.headers['Cache-Control'] = 'public, max-age=300'
    session["data#{params['document']}"]
  end

  post '/' do
    $count = $count+1
    session["data#{$count}"] = request.env["rack.input"].read
    "http://json-store.heroku.com/#{$count.to_s}"
  end
end

