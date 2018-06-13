require "sinatra"
require "sinatra/contrib" if development?
require_relative './controllers/posts_controller.rb'

run PostsController
