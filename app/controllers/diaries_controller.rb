class DiariesController < ApplicationController
  def index
    @diaries = Diary.all.includes(:articles)
  end

  def new
    @diary = Diary.new
    @diary.articles.build
  end

  def create
    Diary.create(diary_params)
    redirect_to diaries_path
  end

  def show
    @diary = Diary.find(params[:id])
    @articles = @diary.articles
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def diary_params
    params.require(:diary).permit(:date, :title, articles_attributes: [:id, :item_id, :date, :article, :_destrpy])
  end
end
