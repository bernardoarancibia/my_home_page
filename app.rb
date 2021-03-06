require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'twitter'

enable :inline_templates
set :root, File.dirname(__FILE__)


get '/' do
  ######################
  # Twitter Username
  @user = "bernarancibia"
  ######################
  search = Twitter::Search.new.from(@user)
  @twitts = search.map { |t| [t.profile_image_url, t.id_str, t.text] }
  @twitt_link = "http://twitter.com/#{@user}/status/"
  haml :index
end

get '/app.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :app
end


__END__

@@app
body
  color: #2C2C2C
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
  color: #5B5B5B

a:hover
  color: orange

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
  padding: 5px 20px 20px 30px
  -moz-border-radius: 10px
  -webkit-border-radius: 10px
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
  width: 100%
  td
    background-color: #F3F3F3
  a
    color: #5B5B5B
    font-size: 13px
  a:hover
    color: orange

#footer
  color: #7F7F7F

.photo
  padding-left: 40px
  background-color: white

.twitt
  width: 90%

.orange
  color: #FFB144

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
      %p.title
        = "BERNARDO"
        %span.orange
          = "# ARANCIBIA"
    #container= yield
    #footer
      %center
        %p= "Bernardo Arancibia Araos - Viña del Mar, Chile #{Time.now.year}"

@@index
#main_menu
  %ul
    %li
      %a{:href => 'http://www.github.com/bernardoarancibia', :title => 'Mis repositorios personales' }
        GitHub
    %li
      %a{:href => 'http://cl.linkedin.com/pub/bernardo-arancibia-araos/23/177/a84', :title => 'Mi perfil en  LinkedIn'}
        LinkedIn
    %li
      %a{:href => '#', :title => 'Email: debiano@gmail.com' }
        Contact me
%br
%img.photo{ :src => 'images/foto.png', :style => 'float: right' }
%h2 Sobre mí:
%p
  Estudiante de la carrera Técnico Universitario en Informática (Analista Programador)
  en la
  %a{:href => 'http://www.utfsm.cl', :target => '_blank'}
    Universidad Técnica Federíco Santa María
  , sede Viña del Mar.
%p
  Actualmente estoy realizando mi práctica profesional en
  %a{:href => 'http://www.comparaonline.com', :target => '_blank'}
    ComparaOnline
  , lugar que me dió la oportunidad de aportar con lo mío y a la vez aprender muchísimo del mundo del desarrollo
  y el emprendimiento web.
%p
  Miembro de la comunidad
  %a{:href => 'http://www.archlinux.cl', :target => '_blank'}
    Archlinux Chile
  , bajista aficionado y fanático de todo lo que
  tenga que ver con el lenguaje de programación Ruby.

%br
%center
  %table.software
    %tr
      %td
        %a{ :href => 'http://www.ruby-lang.org', :title => 'Ruby Language' }
          %img{ :src => 'images/ruby.png', :alt => 'ruby' }
      %td
        %a{ :href => 'http://rubyonrails.org', :title => 'Ruby on Rails MVC Framework' }
          %img{ :src => 'images/rails.png', :alt => 'rubyonrails' }
      %td
        %a{ :href => 'http://www.sinatrarb.com', :title => 'Sinatra Framework'  }
          %img{:src => 'images/sinatra.png', :alt => 'sinatra'}
      %td
        %a{ :href => 'http://www.jquery.com', :title => 'jQuery Framework'  }
          %img{:src => 'images/jquery.png', :alt => 'jquery'}
      %td
        %a{ :href => 'http://www.vim.org', :title => 'Vim - Text Editor' }
          %img{ :src => 'images/vim.png', :alt => 'vim' }
      %td
        %a{ :href => 'http://git-scm.com', :title => 'Git - Control de Versiones' }
          %img{ :src => 'images/git.png', :alt => 'git' }
      %td
        %a{ :href => 'http://www.archlinux.org', :title => 'Sistemas Linux - Archlinux' }
          %img{ :src => 'images/tux.png', :alt => 'linux' }
%h2 Twitter
%h4
  %a{:href => "http://www.twitter.com/#{@user}"}
    = "@#{@user}"
#twitter
  %table
    - @twitts[0..9].each do |t|
      %tr
        %td
          %img{ :src => t[0], :alt => 'avatar' }
        %td.twitt
          %a{ :href => @twitt_link + t[1], :target => "_blank" }
            = t[2]
