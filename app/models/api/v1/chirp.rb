class Api::V1::Chirp < ApplicationRecord
  belongs_to :user
  has_many :comments, foreign_key: 'api_v1_chirp_id'

  validates :body, length: { maximum: 300 }, allow_blank: false
end
