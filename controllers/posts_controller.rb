class PostsController < Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  # set the root to the parent directory of the current File
  set :root, File.join(File.dirname(__FILE__), '..')

  # sets the view directory correctly
  set :views, Proc.new {File.join(root, "views") }

  $posts =[
    {
      :id => 0,
      :title => "Post 1",
      :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      :id => 1,
      :title => "Post 2",
      :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
    {
      :id => 2,
      :title => "Post 3",
      :body => "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    },
  ]


  get '/posts' do

    @title = "Posts Index"
    @posts = $posts

    erb :'posts/index'
  end


  get '/posts/:id' do
    id = params[:id].to_i
    puts id.class

    @title = 'Show Posts'
    @post = $posts[id]

    erb :'posts/show'
  end
end
