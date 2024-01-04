# frozen_string_literal: true

module Types
  # This class will hold the Queries for the GraphQL API
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find_by(id: id)
    end
  end
end
