class Admin::CompaniesController < Admin::AdminController

  before_filter :find_company, :except => :index

  def update
    if @company.update_attributes(params[:company])
      redirect_to(admin_company_path(@company), :notice => t('companies.edit.successfully'))
    else
      render :action => 'edit'
    end
  end

  protected

  def find_company
    @company = current_user.company
  end

end
