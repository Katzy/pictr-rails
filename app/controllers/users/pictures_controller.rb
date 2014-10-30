module Users
  class PicturesController < ApplicationController
    before_filter :authenticate_user!, only: [:index]

    def index
      user = User.find(params[:user_id])
      if user == current_user
        @pictures = user.pictures
      else
        render text: "Permission denied", status: 403
      end
    end
  end
end