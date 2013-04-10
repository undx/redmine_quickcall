module Quickcall
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_account_left_bottom, :partial => 'users/quickcall'
  end
end
