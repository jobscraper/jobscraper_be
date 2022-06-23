# frozen_string_literal: true

module Types
  class IndeedJobType < Types::BaseObject
    field :title, String, null: false
    field :company, String, null: false
    field :datePosted, String, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :location, String, null: false
    field :salary, String, null: false
  end
end
