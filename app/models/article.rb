#models.article.#!/usr/bin/env ruby -wKU
class Article < ApplicationRecord
  validates_presence_of :title, :body


end
