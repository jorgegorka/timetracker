class Admin::AdminController < MemberController

  before_filter :validate_is_admin

  protected

  def validate_is_admin
    if current_user.admin
      return true
    else
      redirect_to(root_url, :alert => t('companies.admin.wrong_permission')) and return false
    end
  end

end
