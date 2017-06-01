# json.array! @posts, partial: 'posts/post', as: :post
json.posts @posts do |post|
  json.title post.title
  json.body post.body
  json.user post.user
end
