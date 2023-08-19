class Api::V1::Comment < ApplicationRecord
  belongs_to :user
  belongs_to :api_v1_chirp, :class_name => 'Api::V1::Chirp'
end
