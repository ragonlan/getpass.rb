# get random password of arg characters.
#
module Puppet::Parser::Functions
  newfunction(:getpass, :type => :rvalue, :doc => <<-EOS
      Return a variable length password. Default is 15 characters.
    EOS
  ) do |arguments|
    raise(Puppet::ParseError, "getpass(): Wrong number of arguments " +
                "given (#{arguments.size})") if arguments.size > 1
    size = 10
    if arguments[0].is_a? Integer
      size = arguments[0]
    elsif ! arguments[0]
      size = 15
    else
          raise(Puppet::ParseError, "getpass(): Wrong argument type " +
                "given (#{arguments[0]} for integer)")
    end
    array = [
      "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", ":", ";", "<", "=", ">",
        "?", "@", "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L",
        "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
        "^", "_", "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l",
        "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    (1..size).map { array[rand(71)] }.join
#    raise(Puppet::ParseError, "out was #{pass}")
  end
end
