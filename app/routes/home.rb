$count = 0
module Home
  get '/:document' do 
    raise "the requested document does not exist yet" if params['document'].to_i > $count
    response.headers['Cache-Control'] = 'public, max-age=300'
    flash[:data]
  end

  post '/' do
    flash[:data] = request.env["rack.input"].read
    $count = $count+1
    $count.to_s
  end
end

