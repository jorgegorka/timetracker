class Admin::CompaniesController < Admin::AdminController

  def index
    redirect_to admin_company_path(current_user.company)
  end
  def show
    @company = current_user.company
  end

  def edit
    @company = current_user.company
  end

  def update
    @company = current_user.company

    if @company.update_attributes(params[:company])
      redirect_to(admin_company_path(@company), :notice => t('companies.admin.edit.successfully'))
    else
      render :action => 'edit'
    end
  end
end
