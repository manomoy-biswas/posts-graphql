class Mutations::CreatePost < Mutations::BaseMutation
  # arguments passed to the `resolve` method
  argument :title, String, required: true
  argument :body, String, required: true
  argument :id, Integer, required: true

  # return type from the mutation
  field :user, Types::UserType, null: false
  field :post, Types::PostType, null: false
  field :errors, [String], null: false

  def resolve(id:, title:, body:)
    user = User.find_by(id: id)
    post = user.posts.new(title: title, body: body)
    if post.save
      { user: user, post: post, errors: [] }
    else
      { user: user, post: post, errors: posts.errors.full_messages }
    end
  end
end
