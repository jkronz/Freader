class ArticlesController < ApplicationController
  before_filter :authenticate_user!

  def index
    render :json => current_user.articles(params)
  end

end