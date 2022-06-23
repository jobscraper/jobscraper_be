# frozen_string_literal: true

require 'rails_helper'

describe 'indeed service' do
  it 'scrapes indeed service' do
    IndeedService.sixty_results('ruby')
  end
end
