class SessionsController < ApplicationController

  def index
    gon.user_name = "Hello"
  end
  def new
  end

  def create
      user = User.find_by(name: params[:session][:name].downcase)
      #if user && user.authenticate(params[:session][:password])
      if user && user.password === params[:session][:password]
        # session helperで定義済み
        log_in user
        redirect_to "/"
      else
        # エラーメッセージを作成する
        flash.now[:danger] = 'Invalid name/password combination' # 本当は正しくない
        render 'new'
      end
    end
  def destroy
    log_out
    redirect_to root_url
  end
end
