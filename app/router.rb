# frozen_string_literal: true

require "roda"

class Router < Roda
  plugin :render, views: ApplicationSettings.root.join("app/views")
  plugin :partials
  plugin :link_to
  plugin :path

  path :root, "/"
  path :articles, "/articles"

  route do |r|
    r.root do
      view "home"
    end

    r.on "articles" do
      r.get do
        @articles = Article.all

        view "articles/index"
      end
    end
  end
end
