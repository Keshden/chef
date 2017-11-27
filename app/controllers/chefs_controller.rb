class ChefsController < ApplicationController
  before_action :set_chef, only: [:edit, :update, :show, :destroy]

  def index
    @chefs = Chef.all
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = "You have successfully created a chef"
      redirect_to chef_path(@chef)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @chef.update(chef_params)
      flash[:success] = "Chef successfully updated"
      redirect_to chef_path(@chef)
    else
      redirect_to 'edit'
    end
  end

  def show

  end

  def destroy
    @chef.destroy
    flash[:danger] = "Chef successfully deleted"
    redirect_to chefs_path
  end

  private
  def chef_params
    params.require(:chef).permit(:chefName, :email, :password)
  end

  def set_chef
    @chef = Chef.find(params[:id])
  end

end
