# frozen_string_literal: true

# get indeed job listings and turns into poros
class FlexjobsService
  class << self
    def scraper(keyword, page = 1)
      url = "https://www.flexjobs.com/search?search=#{keyword}&location=&srt=date&page=#{page}"
      unparsed_page = HTTParty.get(url)
      parsed_page = Nokogiri::HTML(unparsed_page.body)
      job_cards = parsed_page.css('li.m-0')

      job_cards.map { |job_data| Flexjob.new(job_data) }
      require 'pry'; binding.pry
      # titles = job_cards.map {|job_data| 
      #   job_data.attributes['data-title'].value
      # }

      # locations = job_cards.map {|job_data| 
      #   job_data.css('div.job-locations')[0].children.first.text.strip +
      #   job_data.css('span.job-tag')[0].children[0].text
      # }

      # datePosted = job_cards.map {|job_data| 
      #   job_data.css('div.job-age')[0].children.last.text.strip
      # }

      # url = job_cards.map {|job_data| 
      #   'https://www.flexjobs.com/'+
      #   job_data.css('a.job-link')[0].attributes['href'].value
      # }

      # description = job_cards.map {|job_data| 
      #   job_data.css('div.job-description')[0].children[0].text.strip
      # }
    end

    # def thirty_results(keyword)
    #   0.step(by: 10, to: 10).to_a.map do |start|
    #     scraper(keyword, start)
    #   end.flatten
    # end
  end
end