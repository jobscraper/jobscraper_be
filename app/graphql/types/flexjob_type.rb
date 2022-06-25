# frozen_string_literal: true

module Types
  class FlexjobType < Types::BaseObject
    field :title, String, null: false
    field :datePosted, String, null: false
    field :url, String, null: false
    field :description, String, null: false
    field :location, String, null: false
  end
end
