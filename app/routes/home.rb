$count = 0
module Home
  get '/:document' do
    response.headers['Cache-Control'] = 'public, max-age=300'
    flash[:data]
  end

  post '/' do
    flash[:data] = request.env["rack.input"].read
    $count = $count+1
    $count.to_s
  end
end