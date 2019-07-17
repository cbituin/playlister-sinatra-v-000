require 'rack-flash'

class SongsController < ApplicationController

  use Rack::Flash

  get '/songs' do
    erb :"/songs/index"
  end

  get '/songs/new' do
    erb :"/songs/new"
  end

  get '/songs/:slug' do
    # binding.pry
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.songs_genres
    erb :"/songs/show"
  end

  post '/songs' do
<<<<<<< HEAD
    @song = Song.create(:name => params["Name"])
    @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])

    @song.genre_ids = params[:genres]
    @song.save

    flash[:message] = "Successfully created song."

    redirect("/songs/#{@song.slug}")
  end

  get '/songs/:slug/edit' do
    @song = Song.find_by_slug(params[:slug])
    @artist = Artist.find(@song.artist_id)
    @genres = @song.songs_genres
    erb :"/songs/edit"
=======

      @artist = Artist.create(:name => params["Artist Name"]) unless Artist.where(name: params["Artist Name"]).exists?
      @song = Song.create(params)
      @song.name = params["Name"]
      @song.artist = @artist
      @song.genre_ids = params[:genres]
      @song.save
      binding.pry
      redirect("/songs/#{@song.slug}")

>>>>>>> 14441648761fe3bf35347bfd1d815e8926c0e548
  end

  patch '/songs/:slug' do

    redirect("/songs/#{@song.slug}")
  end

end
