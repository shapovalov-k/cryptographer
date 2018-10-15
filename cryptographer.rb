# encoding: utf-8
#
# Программа, которая шифрует введённое пользователем слово одним из механизмов MD5 или SHA1, версия 1.
#
# (с) shapovalov-k

# Этот код необходим только при использовании unicode-символов на Windows
if Gem.win_platform?
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

# подключаем модуль Digest
require 'digest'

puts "Введите слово или фразу для шифрования:"
phrase_to_encrypt = STDIN.gets.chomp

puts "Каким способом зашифровать: 1. - MD5, 2. - SHA1"
encrypt_method = STDIN.gets.to_i

sha256 = Digest::SHA256.hexdigest phrase_to_encrypt
md5 = Digest::MD5.hexdigest phrase_to_encrypt

puts "Вот что получилось: "
puts "#{sha256}" if encrypt_method == 1
puts "#{md5}" if encrypt_method == 2
