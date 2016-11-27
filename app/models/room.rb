class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  before_validation :sanitize, :namify


  def to_param
    self.name
  end

  def namify
    self.name = self.title.downcase.gsub(" ", "-")
  end

  def sanitize
    self.title = self.title.strip
  end

end
