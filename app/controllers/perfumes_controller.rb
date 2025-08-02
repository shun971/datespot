class PerfumesController < ApplicationController
  def index
    # 一覧表示（必要なければ削除してOK）
  end

  def new
    @perfume = Perfume.new
  end

  def show
    @Perfume = Perfume.find_by(id: params[:id])
  end

  def create
    @Perfume = Perfume.new(perfume_params)
    if @Perfume.save
      flash[:notice] = "診断が完了しました"
      redirect_to perfume_path(@Perfume.id)
    else
      render :new
    end
  end

 private
    def perfume_params
        params.require(:perfume).permit(:relation_level, :mood_preference, :priority_point, :genre_preference, :avoid_point, :access_preference, :extra_needs )
    end
 end

 
