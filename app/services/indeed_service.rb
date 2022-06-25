# frozen_string_literal: true

# get indeed job listings and turns into poros
class IndeedService
  class << self
    def scraper(keyword, start = 0)
      url = "https://www.indeed.com/jobs?q=#{keyword}&fromage=3&start=#{start}&vjk=b277dac7645d5b76"
      unparsed_page = HTTParty.get(url)
      parsed_page = Nokogiri::HTML(unparsed_page.body)
      job_cards = parsed_page.css('div.job_seen_beacon')
      job_cards.map { |job_data| IndeedJob.new(job_data) }
    end

    # def thirty_results(keyword)
    #   0.step(by: 10, to: 10).to_a.map do |start|
    #     scraper(keyword, start)
    #   end.flatten
    # end
  end
end
