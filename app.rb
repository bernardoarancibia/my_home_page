require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'

enable :inline_templates
set :root, File.dirname(__FILE__)


get '/' do
 haml :index
end

get '/app.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :app
end


__END__

@@app
body
  background:
    image: url(images/body_back.png)
    attachment: fixed
  font-family: arial
  font:
    family: 'Droid Sans', arial, serif
p
  font:
    size: 13px

#header
  p.title
    font:
      family: 'Droid Sans', arial, serif
      weight: bold
      size: 2.5em
    text-align: center
    color: black
  height: 2.5em
  margin: auto

#container
  background:
    color: white
  width: 700px
  height: 800px
  margin: auto
  padding: 30px
  -moz-border-radius: 10px

.software
  td
    padding: 10px

.content
  th
    width: 350px

@@layout
!!!5
%html
  %head
    %meta{ :content => "text/html", :charset => "utf-8" }
    %title Bernardo Arancibia Araos
    %link{ :href => 'app.css', :rel => 'stylesheet', :type => 'text/css'}
    %link{ :href => 'http://fonts.googleapis.com/css?family=Lobster&subset=latin', :rel => 'stylesheet', :type => 'text/css'}
    %link{ :href => 'http://fonts.googleapis.com/css?family=Droid+Sans&subset=latin', :rel => 'stylesheet', :type => 'text/css'}
  %body
    #header
      %p.title Bernardo Arancibia
    #container= yield

@@index
%p
  Analista Programador con título Técnico Universitario en Informática, Universidad Técnica
  Federíco Santa María.
%br
%center
  %table.software
    %tr
      %td
        %img{:src => 'images/tux.png'}
      %td
        %img{:src => 'images/ruby.png'}
      %td
        %img{:src => 'images/rails.png'}
      %td
        %img{:src => 'images/sinatra.png'}
%br
%br

%table.content
  %th
    %h2 Blog
  %th
    %h2 Twitter
  %tr
  %td
    Aquí va el contenido del blog
  %td Este es mi twit!
