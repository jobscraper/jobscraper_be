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
    end

    # def thirty_results(keyword)
    #   0.step(by: 10, to: 10).to_a.map do |start|
    #     scraper(keyword, start)
    #   end.flatten
    # end
  end
end
