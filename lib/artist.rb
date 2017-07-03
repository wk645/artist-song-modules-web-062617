require 'pry'

class Artist

  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  extend Findable::ClassMethods
  include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  # def self.find_by_name(name)
  #   @@artists.detect{|a| a.name == name}
  # end

  def initialize
    super
    # self.class.all << self
    @songs = []
  end

  #super placed inside a method will tell that method to look up its behavior in the method of the same name that lives in the parent/super class.
  #@@artists << self
  #which means self.class.all << self

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end

  # def to_param
  #   name.downcase.gsub(' ', '-')
  # end

end
