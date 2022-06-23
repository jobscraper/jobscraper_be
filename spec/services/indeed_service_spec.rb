require 'rails_helper'


describe 'indeed service' do 
  it 'scrapes indeed service' do 
  	jobs = IndeedService.sixty_results('ruby')

  end
end