class SessionsController < ApplicationController
  respond_to :json
  def create
    response = Typhoeus::Request.post("https://verifier.login.persona.org/verify", {
            body: {audience: "http://freader.dev:80", assertion: params[:assertion]}
    })
    json = JSON.parse(response.body)
    @user = User.find_or_create_by_email(json['email'])
    sign_in @user
    render :json => @user.as_json
  end

  def destroy
    sign_out @user
  end
end
