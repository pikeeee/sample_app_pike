class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:destroy, :create, :edit, :update]
    before_action :correct_user, only: [:destroy, :edit]
    def create
        @micropost = current_user.microposts.build(microposts_param)
        @micropost.image.attach(params[:micropost][:image])
        if @micropost.save
            flash[:success] = 'Post success!'
            redirect_to root_path
        else
            render 'static_pages/home'
        end
    end
    def destroy
        micropost = current_user.microposts.find_by(params[:id])
        micropost.destroy
        redirect_to root_path
    end
    def edit
        @micropost = current_user.microposts.find_by(params[:id])
    end
    def update
        @micropost = current_user.microposts.find_by(params[:id])
        if @micropost.update(microposts_param)
            redirect_to root_path
        else
            render 'edit'
        end
    end
    private
    def microposts_param
        params.require(:micropost).permit(:content, :image)
    end
    def correct_user
        @micropost = current_user.microposts.find_by(id: params[:id])
        redirect_to root_url if @micropost.nil?
        end
        
end
