class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user ## modify for re-review
      @micropost = current_user.microposts.build
    end
  end
end
