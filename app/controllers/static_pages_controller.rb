class StaticPagesController < ApplicationController

　#　staticは使わないので後ほど全て削除する
  def home
    if logged_in?
  	 @task = current_user.tasks.build
     @feed_items = current_user.feed.desc.page(params[:page])
    end
  end

  def help

  end

  def about
    # 'app/views/static_pages/about.html.erb'
  end

  def contact
    # app/views/static_pages/contact.html.erb'
  end

end
