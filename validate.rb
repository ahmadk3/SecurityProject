require 'digest'
require 'csv'
require_relative 'csvreader'

#Função para validar o login
#com hash MD5, retornando o tempo
#da consulta
def validateMD5 (user, pass)
  csv = CSV.read('md5.txt', :headers=>true)
  start = DateTime.now.strftime('%Q').to_i
  pass = Digest::MD5.hexdigest(pass)
  csv.each do |row|
    if row["user"] == user
      if row["pass"] == pass
        return DateTime.now.strftime('%Q').to_i - start
      end
    end
  end
  return false
end

#Função para validar o login
#com hash SHA1, retornando o
#tempo da consulta
def validateSHA1 (user, pass)
  csv = CSV.read('sha1.txt', :headers=>true)
  start = DateTime.now.strftime('%Q').to_i
  pass = Digest::SHA1.hexdigest(pass)
  csv.each do |row|
    if row["user"] == user
      if row["pass"] == pass
        return DateTime.now.strftime('%Q').to_i - start
      end
    end
  end
  return false
end

#Função para validar o login
#com hash SHA256, retornando o
# tempo da consulta
def validateSHA256 (user, pass)

  csv = CSV.read('sha256.txt', :headers=>true)
  start = DateTime.now.strftime('%Q').to_i
  pass = Digest::SHA256.hexdigest(pass)
  csv.each do |row|
    if row["user"] == user
      if row["pass"] == pass
        return DateTime.now.strftime('%Q').to_i - start
      end
    end
  end
  return false

end

def validateCC (user, pass)
  csv = CSV.read('base.txt', :col_sep => "|")
  start = DateTime.now.strftime('%Q').to_i
  csv.each do |row|
    if row[0] == user
      if row[1] == unrotate(pass, -12)
        return DateTime.now.strftime('%Q').to_i - start
      end
    end
  end
  return false

end


puts validateMD5 'Rogerio.Bandit.Santos', 'KUKNANFEJ'

puts validateSHA1 'Rogerio.Bandit.Santos', 'KUKNANFEJ'

puts validateSHA256 'Rogerio.Bandit.Santos', 'KUKNANFEJ'

puts validateCC 'Rogerio.Bandit.Santos', 'KUKNANFEJ'

