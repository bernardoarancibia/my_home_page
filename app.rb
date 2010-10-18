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
a
  text-decoration: none
  color: green

#header
  p.title
    font:
      family: 'Droid Sans', arial, serif
      weight: bold
      size: 2em
    color: #FF8E04
  text-shadow: #C0C0C0 0px 2px 1px
  width: 700px
  height: 4em
  margin: auto

#container
  background:
    color: white
  width: 700px
  margin: auto
  padding: 10px 10px 20px 40px
  -moz-border-radius: 10px
  p
    margin-left: 10px

#main_menu
  text-align: right
  text-shadow: #C0C0C0 1px 2px 1px
  ul
    li
      display: inline
      padding: .5em
  padding: .5em

.software
  td
    padding: 10px

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
    #footer
      %center
        %p= Time.now

@@index
#main_menu
  %ul
    %li
      %a{:href => '#'}
        Home
    %li
      %a{:href => '#'}
        GitHub
    %li
      %a{:href => '#'}
        Bookmarks
    %li
      %a{:href => '#'}
        Contact me

%p
  Técnico Universitario en Informática (Analista Programador)
  Universidad TécnicaFederíco Santa María.

%br
%center
  %h4 Tecnologías favoritas
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
