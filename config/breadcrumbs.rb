crumb :root do
  link "メルカリ", root_path
end

crumb :mypage do
  link "マイページ", home_path(current_user.id)
  parent :root
end

crumb :profile do
  link "プロフィール", profile_home_path(current_user.id)
  parent :mypage
end

crumb :profile1 do
  link "本人情報"
  parent :mypage
end

crumb :credit do
  link "支払い方法", credit_home_path(current_user.id)
  parent :mypage
end

crumb :creditcard do
  link "クレジットカード情報入力"
  parent :credit
end

crumb :exhibition do
  link "出品した商品"
  parent :mypage
end

crumb :exhibition1 do
  link "取引中の商品"
  parent :mypage
end

crumb :exhibition2 do
  link "売却済みの商品"
  parent :mypage
end

crumb :logout do
  link "ログアウト"
  parent :mypage
end
# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).