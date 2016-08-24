json.user do
  json.user_id @user.id
  json.user_username @user.username
  json.user_email @user.email
  json.user_password @user.password
end
