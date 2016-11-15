class ContactsController < ApplicationController
  before_action :set_contact, only: [:edit, :update, :destroy]
  
  def new
    if params[:back]
      @contact = Contact.new(contact_params)
    else
      @contact =  Contact.new
    end
  end
 
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      # 一覧画面へ遷移して"ブログを作成しました！"とメッセージを表示します。
    redirect_to new_contact_path, notice: "ささやきありがとうございました！"
    else
    #入力フォームを再描画。
    render action: 'new'
    end
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  private
    def contact_params
      params.require(:contact).permit(:name, :mail_address, :content)
    end
end