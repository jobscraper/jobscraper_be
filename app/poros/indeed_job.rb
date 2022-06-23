# frozen_string_literal: true

# indeed job poro
class IndeedJob
  def initialize(data)
    @data = data
  end

  def title
    return title_sector.css('span')[0].attributes['title'].value if title_sector.count == 1

    title_sector.css('span')[1].attributes['title'].value
  end

  def company
    @data.css('span.companyName').children[0].text
  end

  def datePosted
    return date_sector[0].text if date_sector.count == 1

    date_sector[1].text
  end

  def url
    "www.indeed.com#{@data.css('h2.jobTitle').css('a')[0].attributes['href'].value}"
  end

  def description
    @data.css('div.job-snippet')[0].children[0].children.children.to_a.join(', ')
  end

  def location
    location_sector.children[0].text if location_sector.children.count == 1

    location_sector[0].text
  end

  def salary
    return 'Not provided' if salary_sector.to_a == []

    salary_sector[0].children[0].children[1].text
  end

  private

  def date_sector
    @data.css('span.date')[0].children
  end

  def title_sector
    @data.css('h2.jobTitle').css('span')
  end

  def salary_sector
    @data.css('div.salary-snippet-container')
  end

  def location_sector
    @data.css('div.companyLocation')[0].children
  end
end
