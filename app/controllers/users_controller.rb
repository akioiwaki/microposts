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
    @user = User.edit(params[:id])
     
  end
end
  
  def update
    @user = User.update(params[:id])
    if @user.update_attributes(user_params)
    else
      render 'edit'
    end
    
    def destroy
      @user.destroy
      redirect_to root_path, notice: 'プロフィールを削除しました'
    end
    
  private

    def user_params
      params.require(:user).permit(:name, :email, :region, :profile, :password,
                                   :password_confirmation)
    end
  end
