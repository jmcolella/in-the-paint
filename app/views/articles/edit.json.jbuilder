json.article do
  json.article_id @article.id
  json.article_title @article.title
  json.article_body @article.body
  json.article_team @article.team
  json.article_user @article.user
end