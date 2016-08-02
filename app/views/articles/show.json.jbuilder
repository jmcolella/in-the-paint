json.article do
  json.article_id @article.id
  json.article_title @article.title
  json.article_body @article.body
  json.article_user @article.user
  json.article_votes @article.votes
  json.article_team @article.team
end

json.comments @comments do |comment|
  json.comment_id comment.id
  json.comment_body comment.body
  json.comment_user comment.user
  json.comment_votes comment.votes
end