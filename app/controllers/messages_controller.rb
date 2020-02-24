class MessagesController < ApplicationController
  
  # 共通化したものをまとめて使用
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  
  def index
    @messages = Message.all
  end
  
  def show
  end
  
  def new
    @message = Message.new
  end
  
  def create
    @message = Message.new(message_params)
    
    if @message.save
      flash[:success] = 'Message が正常に投稿されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message が投稿されませんでした'
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(message_params)
      flash[:success] = 'Message は正常に更新されました'
      redirect_to @message
    else
      flash.now[:danger] = 'Message は更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @message.destroy
    
    flash[:success] = 'Message は正常に削除されました'
    redirect_to message_url
  end
  
  
  private
  
  # 共通化
  def set_message
    @message = Message.find(params[:id])
  end
  
  # Strong Parameter
  def message_params
    params.require(:message).permit(:content)
  end
end