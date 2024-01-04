class Mutations::UpdateUser < Mutations::BaseMutation
  # arguments passed to the `resolve` method
  argument :name, String, required: false
  argument :email, String, required: false
  argument :id, Integer, required: true

  # return type from the mutation
  field :user, Types::UserType, null: false
  field :errors, [String], null: false

  def resolve(id:, name:, email:)
    user = User.find_by(id: id)
    if user.update(name: name, email: email)
      { user: user, errors: [] }
    else
      { user: nil, errors: users.errors.full_messages }
    end
  end
end
