class MemosController < ApplicationController
  before_action :set_memo, only: %i[ show ]

  # GET /memos
  def index
    @memos = Memo.all
  end

  # GET /memos/1
  def show
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
    def set_memo
      @memo = Memo.find(params[:id])
    end

    def memo_params
      params.require(:memo).permit(:title, :content)
    end
end
