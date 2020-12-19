class Telno < ApplicationRecord
  belongs_to :user, :optional => true
end
