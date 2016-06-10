#funcion base in pwgen from https://forge.puppet.com/rgevaert/pwgen

module Puppet::Parser::Functions
  newfunction(:getpass, :type => :rvalue, :doc => <<-EOS
  Retorna una cadena aletaroia de tamanno 15.
EOS
    ) do |args|
    size = args[0]
    array = [
      "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">",
        "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
        "^", "_", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
        "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    (1..size).map { array[rand(71)] }.join
  end
end
