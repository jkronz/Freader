class ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def index
    render :json => current_user.articles(params)
  end

  def update
    article = current_user.user_feed_articles.find(params[:id])
    article.update_attributes(safe_parameters)
    render :json => article
  end

  private
  def safe_parameters
    params.slice(:read, :keep_unread, :favorite)
  end
end