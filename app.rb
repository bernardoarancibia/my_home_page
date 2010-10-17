require 'rubygems'
require 'sinatra'

get '/' do
 haml :index
end

__END__

@@index
%h1 Hola Mundo!
