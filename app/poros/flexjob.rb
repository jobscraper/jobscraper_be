# frozen_string_literal: true

# indeed job poro
class Flexjob
  def initialize(data)
    @data = data
  end

  def title
    @data.attributes['data-title'].value
  end

  def datePosted
    @data.css('div.job-age')[0].children.last.text.strip
  end

  def url
    "https://www.flexjobs.com/#{@data.css('a.job-link')[0].attributes['href'].value}"
  end

  def description
    @data.css('div.job-description')[0].children[0].text.strip
  end

  def location
    @data.css('div.job-locations')[0].children.first.text.strip + @data.css('span.job-tag')[0].children[0].text
  end
end
