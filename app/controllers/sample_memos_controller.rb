class SampleMemosController < ApplicationController
  before_action :set_sample_memo, only: %i[ show edit update destroy ]

  # GET /sample_memos or /sample_memos.json
  def index
    @sample_memos = SampleMemo.all
  end

  # GET /sample_memos/1 or /sample_memos/1.json
  def show
  end

  # GET /sample_memos/new
  def new
    @sample_memo = SampleMemo.new
  end

  # GET /sample_memos/1/edit
  def edit
  end

  # POST /sample_memos or /sample_memos.json
  def create
    @sample_memo = SampleMemo.new(sample_memo_params)

    respond_to do |format|
      if @sample_memo.save
        format.html { redirect_to @sample_memo, notice: "Sample memo was successfully created." }
        format.json { render :show, status: :created, location: @sample_memo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sample_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sample_memos/1 or /sample_memos/1.json
  def update
    respond_to do |format|
      if @sample_memo.update(sample_memo_params)
        format.html { redirect_to @sample_memo, notice: "Sample memo was successfully updated." }
        format.json { render :show, status: :ok, location: @sample_memo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sample_memo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sample_memos/1 or /sample_memos/1.json
  def destroy
    @sample_memo.destroy
    respond_to do |format|
      format.html { redirect_to sample_memos_url, notice: "Sample memo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sample_memo
      @sample_memo = SampleMemo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sample_memo_params
      params.require(:sample_memo).permit(:title, :content)
    end
end
