#!/usr/bin/env ruby

exit 0 if `pgrep Spotify` == ''
result = `spotify status`
playing, artist, album, track, position = result.split(/\n/)
exit 0 if playing.match(/paused/)
artist = artist.sub("\e[m\u000FArtist: ", '').strip
album = album.sub('Album: ', '').strip
track = track.sub('Track: ', '').strip

output = "#{artist} - #{track}"
if output.length > 40
  output = output.slice(0, 40) + '…'
end

puts "♫ #{output} ♫"
