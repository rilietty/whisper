class WhispersController < ApplicationController
  before_action :set_whisper, only: [:edit, :update, :destroy]
  
  def index
    @whispers = Whisper.all
  end
  
  def new
    if params[:back]
      @whisper = Whisper.new(whispers_params)
    else
      @whisper = Whisper.new
    end
  end
  
  def create
    @whisper = Whisper.new(whispers_params)
    if @whisper.save
     redirect_to whispers_path, notice: "ささやきました！"
    else
    #入力フォームを再描画。
     render action: 'new'
    end
  end
 
  def edit
    @whisper = Whisper.find(params[:id])
  end
  
  def update
    @whisper = Whisper.find(params[:id])
    if @whisper.update(whispers_params)
      redirect_to whispers_path, notice: "ささやきを削除しました！"
    else
      render action: 'edit'
    end
  end
  
  def destroy
    @whispers = Whisper.find(params[:id])
    @whisper.destroy
    redirect_to whispers_path, notice: "ささやきを削除しました！"
  end
  
  def confirm
    @whisper = Whisper.new(whispers_params)
    render :new if @whisper.invalid?
  end
  
  private
    def whispers_params
      params.require(:whisper).permit(:title, :content)
    end
    
    def set_whisper
      @whisper = Whisper.find(params[:id])
    end
end