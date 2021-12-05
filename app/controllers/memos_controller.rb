class MemosController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[ index show ]
  before_action :set_memo, only: %i[ show edit update destroy ]

  # GET /memos
  def index
    memos = Memo.all.page params[:page]

    if params[:title].present?
      memos = memos.where("title LIKE ?", "%#{params[:title]}%")
    end

    @memos = memos.page params[:page]
  end

  # GET /memos/1
  def show
  end

  # GET /memos/new
  def new
    @memo = Memo.new
  end

  # GET /memos/1/edit
  def edit
  end

  # POST /memos
  def create
    @memo = current_user.memos.new(memo_params)
    if @memo.save
      redirect_to @memo, notice: "Memo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /memos/1
  def update
    if @memo.update(memo_params)
      redirect_to @memo, notice: "Memo was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /memos/1
  def destroy
    @memo.destroy
    edirect_to memos_url, notice: "Memo was successfully destroyed."
  end

  private
    def set_memo
      @memo = current_user.memos.find(params[:id])
    end

    def memo_params
      params.require(:memo).permit(:title, :content)
    end
end
