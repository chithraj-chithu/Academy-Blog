# frozen_string_literal: true

class Blog < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :comments
  has_many :blog_reactions
end
