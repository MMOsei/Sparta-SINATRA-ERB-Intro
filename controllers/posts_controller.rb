class PostsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # set the root to the parent directory of the current File
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new {File.join(root, "views") }

  get '/' do
    "Hello World"
  end

end
