class MemosController < ApplicationController
  # GET /memos
  def index
    @memos = Memo.all
  end

  # GET /memos/new
  def new
    @memo = Memo.new
  end

  # POST /memos
  def create
    @memo = Memo.new(memo_params)
    if @memo.save
      redirect_to @memo, notice: "Memo was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
    def memo_params
      params.require(:memo).permit(:title, :content)
    end
end
