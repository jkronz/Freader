class HomeController < ApplicationController
  layout 'freader'
  before_filter :authenticate_user!

  def index
  end
end
