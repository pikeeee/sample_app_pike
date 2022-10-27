class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:destroy, :create, :edit, :update]
    def create
        @micropost = current_user.microposts.build(microposts_param)
        if @micropost.save
            flash[:success] = 'Post success!'
            redirect_to root_path
        else
            render 'static_pages/home'
        end
    end
    def destroy
        micropost = current_user.micropost.find_by(params[:id])
        micropost.destroy
        if micropost.save
        end
    end
    def edit
    end
    private
    def microposts_param
        params.require(:micropost).permit(:content)
    end
end
