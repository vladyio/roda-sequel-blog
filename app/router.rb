# frozen_string_literal: true

require "roda"

class Router < Roda
  plugin :sessions, secret: ApplicationSettings.secret_key
  plugin :route_csrf
  plugin :forme_route_csrf
  plugin :forme_set, secret: ApplicationSettings.secret_key
  plugin :all_verbs

  plugin :flash
  plugin :render, views: ApplicationSettings.root.join("app/views")
  plugin :partials
  plugin :link_to
  plugin :path

  path :root, "/"
  path :articles, "/articles"
  path(:article) { |article| "/articles/#{article.id}" }
  path :new_article, "/articles/new"
  path(:edit_article) { |article| "/articles/#{article.id}/edit" }
  path(:delete_article) { |article| "/articles/#{article.id}/delete" }

  route do |r|
    # GET /
    r.root do
      view "home"
    end

    # GET /articles
    r.on "articles" do
      r.get true do
        @articles = Article.reverse_order(:created_at)

        view "articles/index"
      end

      # GET /articles/new
      r.get "new" do
        @article = Article.new

        view "articles/new"
      end

      # POST /articles
      r.post true do
        @article = forme_set(Article.new)
        @article.save

        flash[:notice] = "Article was successfully created."

        r.redirect articles_path
      end

      r.on Integer do |article_id|
        @article = Article.with_pk!(article_id)

        # GET /articles/:article_id/edit
        r.get "edit" do
          view "articles/edit"
        end

        # DELETE /articles/:article_id
        r.get "delete" do
          @article.destroy
          flash[:notice] = "Article was successfully deleted."

          r.redirect articles_path
        end

        # POST /articles/:article_id
        r.post true do
          @article.update(r.params["article"])
          flash[:notice] = "Article was successfully updated."

          r.redirect articles_path
        end
      end
    end
  end
end
