# frozen_string_literal: true

require "sinatra"
require "sinatra/cookies"

CABLE_URL = "ws://localhost:9292/cable"

class App < Sinatra::Application # :nodoc:
  set :public_folder, 'assets'

  enable :sessions
  set :session_secret, 'my_secrets'

  # get '/' do
  #   if session[:user]
  #     slim :index
  #   else
  #     slim :login
  #   end
  # end

  #  get '/sign_in' do
  #    slim :login
  #  end

  #  post '/message' do
    
  #    if params['user']
  #      session[:user] = params['user']
  #      cookies["user"] = params['user']
  #    end
  #  end
  # post '/rooms' do
  #   if params['id']
  #     redirect "/rooms/#{params['id']}"
  #   else
  #     slim :index
  #   end
  # end

  # get '/rooms/:id' do
  #   if session[:user]
  #     @room_id = params['id']
  #     @user = session[:user]
  #     slim :room
  #   else
  #     slim :login
  #   end
  # end
end
