class FeedsController < ApplicationController
  before_filter :authenticate_user!

  def create
    user_feed = current_user.create_feed(params[:url])
    render :json => user_feed, :status => :created
  end

  def index
    render :json => current_user.user_feeds
  end

  def destroy
    user_feed = UserFeed.find(params[:id])
    user_feed.destroy
    render :json => {}, :status => :deleted
  end

end
