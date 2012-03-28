module Rosalie
  module Version
    Described = (IO::popen('git describe --long') { |gs| gs.read }).strip
    Number = Described.gsub('-', '.').gsub(/^v/, '').split('.')[0..-2].join('.')
    Date = Date.strptime( IO::popen('git show -s --format="%ct"') { |gs| gs.read } , "%s")
    Revision = (IO::popen('git show -s --format="%H"') { |gs| gs.read }).strip
  end
end
