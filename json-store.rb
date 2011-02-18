$: << File.join(File.dirname(File.expand_path(__FILE__)), '/lib/')
Dir[File.join(File.dirname(__FILE__), "/app/**/*.rb")].each do |file|
  require file
end
enable :sessions
set :views, File.dirname(__FILE__) + "/views"


module JsonStore
  class Application < Sinatra::Application
    include Home
  end
end
