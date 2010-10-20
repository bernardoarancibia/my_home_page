require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'twitter'

enable :inline_templates
set :root, File.dirname(__FILE__)


get '/' do
 search = Twitter::Search.new.from('bernarancibia')
 @twitts = search.map {|p| p.text}
 haml :index
end

get '/app.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :app
end


__END__

@@app
body
  margin: 0px
  background:
    image: url(images/body_back.png)
    attachment: fixed
  font:
    family: 'Droid Sans', arial, serif
p
  font:
    size: 13px
a
  text-decoration: none
  color: #7F7F7F

a:hover
  color: red

#header
  p.title
    font:
      family: 'Droid Sans', arial, serif
      weight: bold
      size: 3.8em
    color: white
  text-shadow: #C0C0C0 0px 2px 1px
  width: 740px
  height: 49px
  margin: auto

#container
  background:
    color: white
  width: 700px
  margin: auto
  padding: 5px 10px 20px 40px
  -moz-border-radius: 20px 20px 10px 10px
  -webkit-border-radius: 20px 20px 10px 10px
  p
    margin-left: 20px
    margin-right: 5px

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

.twitter
  td
    background-color: #F3F3F3
    width: 600px

#footer
  color: white

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
      %p.title BERNARDO ARANCIBIA
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
      %a{:href => 'http://www.github.com/bernardoarancibia'}
        GitHub
    %li
      %a{:href => '#'}
        Bookmarks
    %li
      %a{:href => '#'}
        Contact me
%br
%img{ :src => 'images/foto.png', :style => 'float: right' }
%h1 ¿Quién soy?
%p
  Estudiante de la carrera Técnico Universitario en Informática (Analista Programador)
  en la Universidad Técnica Federíco Santa María, sede Viña del Mar.
%p
  Miembro de la comunidad Archlinux Chile, bajista aficionado y fanático de todo lo que
  tenga que ver con el lenguaje de programación Ruby.

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
%h2 Twitter
%h4
  %a{:href => "http://www.twitter.com/bernarancibia"}
    @bernarancibia
%twitter.twitter
  %table
    - @twitts[0..4].each do |t|
      %tr
        %td
          %p&= t
