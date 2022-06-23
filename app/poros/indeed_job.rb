class IndeedJob
  def initialize(data)
    @data = data
  end

  def title
    if @data.css('h2.jobTitle').css('span').count == 1
      @data.css('h2.jobTitle').css('span').css('span')[0].attributes['title'].value
    else
      @data.css('h2.jobTitle').css('span').css('span')[1].attributes['title'].value
    end
  end

  def company
    @data.css('span.companyName').children[0].text
  end

  def datePosted
    if @data.css('span.date')[0].children.count == 1
      @data.css('span.date')[0].children[0].text
    else
      @data.css('span.date')[0].children[1].text
    end
  end

  def url
    'www.indeed.com' + @data.css('h2.jobTitle').css('a')[0].attributes['href'].value
  end

  def description
    @data.css('div.job-snippet')[0].children[0].children.children.to_a.join(', ')
  end

  def location
    if @data.css('div.companyLocation')[0].children.children.count == 1
      @data.css('div.companyLocation')[0].children.children[0].text
    else
      @data.css('div.companyLocation')[0].children[0].text
    end
  end

  def salary
    if @data.css('div.salary-snippet-container').to_a != []
      @data.css('div.salary-snippet-container')[0].children[0].children[1].text
    else
      'Not provided'
    end
  end
end
