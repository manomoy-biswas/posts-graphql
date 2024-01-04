class Mutations::CreateUser < Mutations::BaseMutation
  # arguments passed to the `resolve` method
  argument :name, String, required: true
  argument :email, String, required: true

  # return type from the mutation
  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(name:, email:)
    user = User.new(name: name, email: email)
    if user.save
      { user: user, errors: [] }
    else
      { user: nil, errors: users.errors.full_messages }
    end
  end
end
