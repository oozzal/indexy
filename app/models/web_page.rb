class WebPage < ApplicationRecord
  has_many :headings, dependent: :destroy
  has_many :links, dependent: :destroy

  before_create :format_url
  after_create :parse

  private

  def format_url
    self.url = url =~ /http/ ? url : "http://#{url}"
  end

  def parse
    doc = Nokogiri::HTML.parse(HTTParty.get(url))
    update_column(:title, doc.at_css('title').content)
    %w(h1 h2 h3).each do |heading_type|
      doc.css(heading_type).each do |heading_node|
        headings.create(heading_type: heading_type, content: heading_node.content) if heading_node.content.present?
      end
    end
    doc.css('a').each do |link|
      links.create(href: link['href'], content: link.content) if link_valid?(link['href'])
    end
  end

  def link_valid?(href)
    href.present? && href != '#' && !href.starts_with?('?')
  end
end
