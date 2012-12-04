#coding:utf-8

ActiveAdmin::Dashboards.build do

  # Define your dashboard sections here. Each block will be
  # rendered on the dashboard in the context of the view. So just
  # return the content which you would like to display.
  
  # == Simple Dashboard Section
  # Here is an example of a simple dashboard section
  #
  section "СоТворение Будущего (Понедельник)", :priority => 1 do
    ul do
      User.morning_mon.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "СоТворение Будущего (Вторник)", :priority => 2 do
    ul do
      User.morning_tue.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "СоТворение Будущего (Среда)", :priority => 3 do
    ul do
      User.morning_wed.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "СоТворение Будущего (Четверг)", :priority => 4 do
    ul do
      User.morning_thu.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "СоТворение Будущего (Пятница)", :priority => 5 do
    ul do
      User.morning_fri.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "СоТворение Будущего (Суббота)", :priority => 6 do
    ul do
      User.morning_sat.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end
  
  section "СоТворение Будущего (Восскресенье)", :priority => 7 do
    ul do
      User.morning_sun.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end



  section "Мастер воплощения (Понедельник)", :priority => 8 do
    ul do
      User.s1_mon.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "Здоровье. Красота. Бессмертие. (Вторник)", :priority => 9 do
    ul do
      User.s2_tue.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "Мужчина-женщина и верность (Среда)", :priority => 10 do
    ul do
      User.s3_wed.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "Секреты изобилия и благосостояния (Четверг)", :priority => 11 do
    ul do
      User.s4_thu.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "«Звездная Половинка» - встретить, узнать (Пятница)", :priority => 12 do
    ul do
      User.s5_fri.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "Работа с родом. Как быть счастливым? (Cуббота)", :priority => 13 do
    ul do
      User.s6_sat.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "Готов ли ты к Переходу? (Cуббота)", :priority => 14 do
    ul do
      User.s7_sat.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  section "Защита от магии и колдовства (Восскресенье)", :priority => 15 do
    ul do
      User.s8_sun.each do |u|
        li link_to(u.name, admin_member_path(u))
      end
    end
  end

  # == Render Partial Section
  # The block is rendered within the context of the view, so you can
  # easily render a partial rather than build content in ruby.
  #
  #   section "Recent Posts" do
  #     div do
  #       render 'recent_posts' # => this will render /app/views/admin/dashboard/_recent_posts.html.erb
  #     end
  #   end
  
  # == Section Ordering
  # The dashboard sections are ordered by a given priority from top left to
  # bottom right. The default priority is 10. By giving a section numerically lower
  # priority it will be sorted higher. For example:
  #
  #   section "Recent Posts", :priority => 10
  #   section "Recent User", :priority => 1
  #
  # Will render the "Recent Users" then the "Recent Posts" sections on the dashboard.
  
  # == Conditionally Display
  # Provide a method name or Proc object to conditionally render a section at run time.
  #
  # section "Membership Summary", :if => :memberships_enabled?
  # section "Membership Summary", :if => Proc.new { current_admin_user.account.memberships.any? }

end
