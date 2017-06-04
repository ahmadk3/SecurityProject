require_relative 'csvreader'
require 'digest'

startTime = DateTime.now.strftime('%Q').to_i
database = fileReader 'base.txt'
endTime = DateTime.now.strftime('%Q').to_i

puts ((endTime - startTime)/1000.0).to_s() + " seconds to decrypt the base"


#SHA256
file = File.open('sha256.txt', 'w')
startTime = DateTime.now.strftime('%Q').to_i
database.each do |row|
  file.write(row[0] + '|' + (Digest::SHA256.digest row[1]) + "\n")
end
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - startTime)/1000.0).to_s() + " seconds to SHA256"
file.close

#SHA1
file = File.open('sha1.txt', 'w')
startTime = DateTime.now.strftime('%Q').to_i
database.each do |row|
  file.write(row[0] + '|' + (Digest::SHA1.digest row[1]) + "\n")
end
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - startTime)/1000.0).to_s() + " seconds to SHA1"
file.close

#MD5
file = File.open('md5.txt', 'w')
startTime = DateTime.now.strftime('%Q').to_i
database.each do |row|
  file.write(row[0] + '|' + (Digest::MD5.digest row[1]) + "\n")
end
endTime = DateTime.now.strftime('%Q').to_i
puts ((endTime - startTime)/1000.0).to_s() + " seconds to MD5"
file.close