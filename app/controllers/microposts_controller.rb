class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create]
    
    def create
        if params[:micropost_id].present?
            @originalpost = Micropost.find_by(id: params[:micropost_id])
            @micropost = current_user.microposts.build(content: @originalpost.content, repost: "true")
#            @micropost.user_id = current_user.id
#            @micropost.repost = "true"
#            @micropost.delete(id)
#            @micropost = current_user.microposts.build(user_id = [:repost] = "true"
        else
            @micropost = current_user.microposts.build(micropost_params)
        end
        if @micropost.save
            flash[:success] = "Micropost created!"
            redirect_to root_url
        else
            render 'static_pages/home'
        end
        
    end
    
    def repost
    end
    
    def destroy
        @micropost = current_user.microposts.find_by(id: params[:id])
        return redirect_to root_url if @micropost.nil?
        @micropost.destroy
        flash[:success] ="Micropost deleted"
        redirect_to request.referrer || root_url
    end
    
    private
    
    def micropost_params
        params.require(:micropost).permit(:content)
    end
end
