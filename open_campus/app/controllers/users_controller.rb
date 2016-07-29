class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def omikuzi
    #current_userメソッドで表示中のユーザーオブジェクトを表示
    gon.user_name = current_user
  end

  def omikuzi_check
    user = User.find_by(name: params[:name])
    if user.flag
      puts("Hello")
      flash[:danger] = "ごめんさい。ガチャは一回しかひけません"
    else
      puts("hollo")
      user.flag = true
      user.result = params[:val]
      user.save
    end
    render json:"success"
    #render :nothing => true
    # redirect_to '/omikuzi'
    #render 'omikuzi'
  end

$numbers = [25839, 36217, 58762, 87253, 92363, 58723, 69723, 60203, 11392, 63697, 72529, 92675, 76432, 82921, 15872, 29863]
$numbers = $numbers.uniq
  def create
    @user = User.new(user_params)    # 実装は終わっていないことに注意!
    puts(user_params[:uniq])
    if  $numbers.include?(user_params[:uniq].to_i) && uniq_check(user_params[:uniq]) && name_check(user_params[:name]) && user_params[:password] === user_params[:password_confirm] &&  @user.save
      @user.flag = false
      @user.save
      log_in @user
      flash[:success] = "三谷研究室へようこそ!"
      redirect_to "/"
    else
      render 'new'
    end
  end

  def user_params
    params.require(:user).permit(:name, :password, :password_confirm, :uniq)
  end

  def uniq_check(num)
    foo = User.find_by(uniq: num.to_i)
    if (foo == nil)
      return true
    else
      return false
    end
  end

  def name_check(name)
    bar = User.find_by(name: name)
    if (bar == nil)
      return true
    else
      return false
    end
  end
end
