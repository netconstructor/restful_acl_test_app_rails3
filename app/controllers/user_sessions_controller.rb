class UserSessionsController < InheritedResources::Base

  skip_before_filter :has_permission?

  def create
    create!{ parent_widgets_path }
  end

  def destroy
    UserSession.find.destroy
    redirect_to login_path
  end

end