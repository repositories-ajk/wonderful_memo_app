class MypageController < ApplicationController
  # GET /mypage
  def index
    memos = current_user.memos

    if params[:title].present?
      memos = memos.where("title LIKE ?", "%#{params[:title]}%")
    end

    @memos = memos.page params[:page]
  end
end
