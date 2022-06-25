# frozen_string_literal: true

module Types
  # defines fields for graphql api call
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end

    field :indeedJobs, [Types::IndeedJobType], null: false do
      argument :keyword, String
    end
    def indeedJobs(keyword:)
      IndeedService.scraper(keyword)
    end

    field :flexjobs, [Types::FlexjobType], null: false do
      argument :keyword, String
    end
    def flexjobs(keyword:)
      FlexjobsService.scraper(keyword)
    end
  end
end
