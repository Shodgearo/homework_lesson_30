require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:blog.db"

class Post < ActiveRecord::Base
end

class Comment < ActiveRecord::Base
end

before do
  @posts = Post.all
end

get '/' do
   erb :index
end

get '/create' do
  erb :create
end

post '/create' do
  form = Post.new(params[:form])
  if form.save
    erb :index
  else
    erb :create
  end
end

get '/post/:id' do
  @post = Post.find(params[:id])
  @comments = Comment.where(post_id: params[:id])

  erb :post
end

post '/post/:id' do
  @post = Post.find(params[:id])
  @comments = Comment.where(post_id: params[:id])
  
  comment = Comment.new(params[:form])
  comment.post_id = params[:id]

  if comment.save
    erb :post
  else
    erb :index
  end
end