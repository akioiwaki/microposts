class UsersController < ApplicationController
  def show 
   @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    # @user = User.find(params[:id])
    # if @user.save
    #   flash[:success] = "プロフィールが変更されました"
    #   redirect_to @user
    # else
    #   render 'edit'
    # end
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
    else 
      render 'edit'
    end
  end
    
    def destroy
      session[:user_id] = nil
      redirect_to root_path
    end
    
  private

    def user_params
      params.require(:user).permit(:name, :email, :region, :profile, :password,
                                   :password_confirmation)
    end
end
