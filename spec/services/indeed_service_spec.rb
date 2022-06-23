# frozen_string_literal: true

require 'rails_helper'

describe 'indeed service' do
  xit 'scrapes indeed service' do
    IndeedService.thirty_results('ruby')
  end
end
