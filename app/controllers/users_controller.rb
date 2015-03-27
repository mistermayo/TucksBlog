class UsersController < ApplicatonController

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Signed up successfully"
    else
      render :new
    end
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path
  end
end

private
  def user_params
    params.require(:user).permit(:username, :email, :encrypted_password)
  end
end
