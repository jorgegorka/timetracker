Before do
  #companies
  company     = Factory(:company)

  #users
  admin       = Factory(:admin, :company_id => company.id)
  user        = Factory(:user,  :company_id => company.id)

  #job
  ibm         = Factory(:job, :company_id => company.id, :title => 'Proyecto IBM')

  #labor
  active      = Factory(:labor, :job_id => ibm.id, :user_id => user.id, :start_at => 6.hours.ago)
  Factory(:labor, :job_id => ibm.id, :user_id => user.id, :created_at => 2.hours.ago, :hours => 2, :minutes => 30)
  finished    = Factory(:labor, :job_id => ibm.id, :user_id => user.id, :start_at => 87.hours.ago, :end_at => 79.hours.ago)
end
