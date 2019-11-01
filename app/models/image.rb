class Image < ApplicationRecord
  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true
  validate :image_url_format_validation

  def image_url_format_validation
    return if url.blank?

    errors.add(:url, 'Invalid URL format') unless url.match(URI::DEFAULT_PARSER.make_regexp)
    errors.add(:url, 'Image links must use HTTP') unless url.match(URI.regexp(%w[http https]))
  end
end
