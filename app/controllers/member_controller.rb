class MemberController < ApplicationController
  before_filter :login_required
end
