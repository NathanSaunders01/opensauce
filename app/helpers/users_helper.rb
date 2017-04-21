module UsersHelper
  def skill_icon
    if @user.profile.skills == "Graphic Designer"
      "<i class='fa fa-paint-brush'></i>".html_safe
    elsif @user.profile.skills == "Web Developer"
      "<i class='fa fa-laptop'></i>".html_safe
    elsif @user.profile.skills == "App Developer"
      "<i class='fa fa-mobile-phone'></i>".html_safe
    elsif @user.profile.skills == "Entrepreneur"
      "<i class='fa fa fa-lightbulb-o'></i>".html_safe
    elsif @user.profile.skills == "Investor"
      "<i class='fa fa fa-dollar'></i>".html_safe
    elsif @user.profile.skills == "Media"
      "<i class='fa fa-pencil'></i>".html_safe
    end
  end
end