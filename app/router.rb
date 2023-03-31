# frozen_string_literal: true

require "roda"

class Router < Roda
  plugin :sessions, secret: ApplicationSettings.secret_key
  plugin :route_csrf
  plugin :forme_route_csrf

  plugin :render, views: ApplicationSettings.root.join("app/views")
  plugin :partials
  plugin :link_to
  plugin :path

  path :root, "/"
  path :articles, "/articles"
  path :new_article, "/articles/new"

  route do |r|
    r.root do
      view "home"
    end

    r.on "articles" do
      r.get true do
        @articles = Article.all

        view "articles/index"
      end

      r.get "new" do
        @article = Article.new

        view "articles/new"
      end
    end
  end
end
