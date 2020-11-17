require_relative './song.rb'
class Application 

@@songs = [Song.new("Worst", "Drake"), Song.new("Swervin", "A Boogie")] 

def call(env) 
resp = Rack::Response.new 
req = Rack::Request.new(env) 

if req.path.match(/songs/)
  song_title = req.path.split("/songs").last
  song = @@songs.find{|s| s.title == song_title} 
  
  resp.write song.artist 
end 
 
resp.finish 
end 
end 