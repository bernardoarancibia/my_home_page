require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'twitter'

enable :inline_templates
set :root, File.dirname(__FILE__)


get '/' do
 search = Twitter::Search.new.from('bernarancibia')
 @twitts = search.map {|s| s.text}
 @image = search.map {|s| s.profile_image_url}
 @image = @image[0]
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

img
  border: 0

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
      size: 250%
    color: #565656
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

#twitter
  width: 90%
  td
    background-color: #F3F3F3

#footer
  color: white

.photo
  padding-left: 40px
  background-color: white

.twitt
  width: 450px

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
        %p= "Bernardo Arancibia Araos -- Viña del Mar, Chile, #{Time.now.year}"

@@index
#main_menu
  %ul
    %li
      %a{:href => '/'}
        Home
    %li
      %a{:href => 'http://www.github.com/bernardoarancibia'}
        GitHub
    %li
      %a{:href => 'http://cl.linkedin.com/pub/bernardo-arancibia-araos/23/177/a84'}
        LinkedIn
    %li
      %a{:href => '#'}
        Contact me
%br
%img.photo{ :src => 'images/foto.png', :style => 'float: right' }
%h1 ¿Quién soy?
%p
  Estudiante de la carrera Técnico Universitario en Informática (Analista Programador)
  en la Universidad Técnica Federíco Santa María, sede Viña del Mar.
%p
  Miembro de la comunidad
  %a{:href => 'http://www.archlinux.cl'}
    Archlinux Chile
  , bajista aficionado y fanático de todo lo que
  tenga que ver con el lenguaje de programación Ruby.

%br
%center
  %table.software
    %tr
      %td
        %a{ :href => 'http://www.archlinux.org' }
          %img{ :src => 'images/tux.png' }
      %td
        %a{ :href => 'http://www.ruby-lang.org' }
          %img{ :src => 'images/ruby.png' }
      %td
        %a{ :href => 'http://rubyonrails.org' }
          %img{ :src => 'images/rails.png' }
      %td
        %a{ :href => 'http://www.sinatrarb.com' }
          %img{:src => 'images/sinatra.png'}
%h2 Twitter
%h4
  %a{:href => "http://www.twitter.com/bernarancibia"}
    @bernarancibia
#twitter
  %table
    - @twitts[0..4].each do |t|
      %tr
        %td
          %img{ :src => @image }
        %td.twitt
          %p= t
