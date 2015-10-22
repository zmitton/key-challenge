class PublicKeysController < ApplicationController
  def index
    @users = User.select(:username, :public_key_string)
  end

  # def create
  #   user = User.find(session[:user_id])
  #   if user
  #     PublicKey.create(user_id: user.id, text: params[:text])
  #   end
  # end
end
