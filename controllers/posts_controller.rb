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


  # INDEX
  get '/posts' do

    @title = "Posts Index"
    @posts = $posts

    erb :'posts/index'
  end

  # GET/NEW
  get '/posts/new' do
    "New Post"
    erb :'posts/new'
  end

  # GET/SHOW
  get '/posts/:id' do
    id = params[:id].to_i
    puts id.class

    @title = 'Show Posts'
    @post = $posts[id]

    erb :'posts/show'
  end

  # POST/CREATE
  post '/posts' do

    new_post ={
      :title => params[:title],
      :description => params[:description]

    }
  $posts.push new_post

  redirect '/posts'
  end

  #UPDATE

  put '/posts/:id' do
    # get id from params
    id = params[:id].to_i

    #get hash from array
    post = %posts[id]

    # Update the necesary hash with the values form the params
    post[:title] = params[:title]
    post[:body] = params[:body]

    #save new dat back in the array
    $posts[id] = post
  end

  get '/posts/:id/edit' do

    id = params[:id].to_i

    @post = $posts[id]

    erb :'posts/edit'
  end

end
