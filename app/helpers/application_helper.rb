module ApplicationHelper
  def is_admin?
    @auth.present? && @auth.is_admin?
  end

  def intellinav

    links = ''
    if @auth.present?
      if @auth.is_admin
        links << "<li>#{link_to('Show_Users', users_path)}</li>"
      end
      links << "<li>#{link_to('Edit User', edit_users_path)}</li>"
      links << "<li>#{link_to('logout '+ @auth.name, login_path, :method => :delete,:confirm => 'Really?')}"
      links << "#{number_to_currency @auth.balance}"
      links << "</li>"
    else
      links << "<li>#{link_to('Create Account',new_user_path)}</li>"
      links << "<li>#{link_to('Login',login_path)}</li>"
    end
  end
end