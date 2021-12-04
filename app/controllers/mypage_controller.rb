class MypageController < ApplicationController
  # GET /mypage
  def index
    @memos = current_user.memos.page params[:page]
  end
end
