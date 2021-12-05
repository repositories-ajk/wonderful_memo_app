class MypageController < ApplicationController
  # GET /mypage
  def index
    articles = current_user.articles.includes(:tags)

    if params[:title].present?
      articles = articles.where("title LIKE ?", "%#{params[:title]}%")
    end

    @articles = articles.page params[:page]
  end
end
