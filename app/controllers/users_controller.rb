class UsersController < ApplicationController
  respond_to :json
  def auth
    response = Typhoeus::Request.post("https://verifier.login.persona.org/verify", {
            body: {audience: "http://freader.dev:80", assertion: params[:assertion]}
    })
    Rails.logger.debug(response.body)
    render :json => response.body
  end
end
