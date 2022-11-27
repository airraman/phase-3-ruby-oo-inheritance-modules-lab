require 'pry'

class Artist
  attr_accessor :name
  attr_reader :songs

  extend Modules

  @@artists = []

  #Initializes with a class variable of an empty array to store all artist names
  #Song is an instance variable empty array 

  def initialize
    @@artists << self
    @songs = []
  end

  def self.find_by_name(name)
    @@artists.detect{|a| a.name == name}
  end

  #Class method which returns an array of all artists

  def self.all
    @@artists
  end

  # def self.reset_all
  #   self.all.clear
  # end

  #Counts each element in the array of artists

  # def self.count
  #   self.all.count
  # end

  ##Adds a new song to the artists collection

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  def to_param
    name.downcase.gsub(' ', '-')
  end
end
