class MypageController < ApplicationController
  # GET /mypage
  def index
    @memos = current_user.memos
  end
end
