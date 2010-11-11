company = Company.create(:subdomain => 'acme', :name => 'Acme', :commercial_name => 'Acme Enterprises', :place => 'Logroño')
user = User.create(:name => 'Test user', :password => 'password' , :password_confirmation => 'password', :email => 'test@user.com')
user.company_id = company.id
user.admin      = true
user.activate!
user.save!
