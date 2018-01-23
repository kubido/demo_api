class Page < ApplicationRecord

  validates_presence_of :url
  validates :url, format: URI::regexp(%w(http https))

  ALLOWED_TAGS = ['h1', 'h2', 'h3']

  def content
    self[:content].split(',')
  end

  def self.savePage(url)
    return {data: [], status: 400, message: "URL can't be blank"} if url.blank?
    return {data: [], status: 400, message: "Not valid URL"} unless url =~ URI::regexp

    page = find_or_initialize_by(url: url, content: parse_content_from_url(url).join(','))

    if page.save
      return {data: page.content, status: 200, message: "Success"}
    else
      return {data: [], status: 200, message: page.error.full_messages}
    end
  end

  def self.parse_content_from_url(url)
    page = RestClient.get(url).body
    doc = Nokogiri::HTML(page)
    parsed_content = []
    ALLOWED_TAGS.each do |tag|
      elements = doc.search(tag)
      elements.map { |e| parsed_content << "#{tag}: #{e.text}" }
    end
    return parsed_content
  end

end
