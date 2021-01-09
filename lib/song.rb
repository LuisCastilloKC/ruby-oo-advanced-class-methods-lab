class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self # passing to the class method self.all
  end

  def self.create
    song = self.new     #instantiates and saves the song, and it returns the new song that was created
    song.save
    return song
  end

  def self.new_by_name(name) #this is instantiates
    song = self.new 
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name      #instantiates and saves a song with a name property
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.detect {|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    split_filename = filename.chop.chop.chop.chop.split(" - ")
    song = Song.new
    song.name = split_filename[1]
    song.artist_name = split_filename[0]
    return song
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    return song
  end

  def self.destroy_all
    self.all.clear
  end

end



# Song Class Methods
#   .create
#     instantiates and saves the song, and it returns the new song that was created
#   .new_by_name
#     instantiates a song with a name property
#   .create_by_name
#     instantiates and saves a song with a name property
#   .find_by_name
#     can find a song present in @@all by name
#     returns falsey when a song name is not present in @@all
#   .find_or_create_by_name
#     invokes .find_by_name and .create_by_name instead of repeating code
#     returns the existing Song object (doesn't create a new one) when provided the title of an existing Song
#     creates a new Song object with the provided title if one doesn't already exist
#   .alphabetical
#     returns all the song instances in alphabetical order by song name
#   .new_from_filename
#     initializes a song and artist_name based on the filename format
#   .create_from_filename
#     initializes and saves a song and artist_name based on the filename format
#   .destroy_all
#     clears all the song instances from the @@all array

# Finished in 0.01249 seconds (files took 0.20564 seconds to load)
# 12 examples, 0 failures