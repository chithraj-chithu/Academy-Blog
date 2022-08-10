# frozen_string_literal: true

class BlogReaction < ApplicationRecord
  belongs_to :user
  belongs_to :blog
end
