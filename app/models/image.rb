require 'uri'

class Image < ApplicationRecord
  validates :link, format: { with: URI::DEFAULT_PARSER.make_regexp,
                             message: 'link must be valid URL' }
end
