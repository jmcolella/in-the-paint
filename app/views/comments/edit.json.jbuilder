json.comment do
  json.comment_id @comment.id
  json.comment_body @comment.body
  json.comment_article @comment.article
  json.comment_user @comment.user
end