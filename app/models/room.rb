class Room < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
  validates :title, presence: true, uniqueness: true, case_sensitive: false
  before_validation :sanitize, :set_name

  def to_param
    self.name
  end

  def set_name
    self.name = self.title.downcase.gsub(" ", "-")
  end

  def sanitize
    self.title = self.title.strip
  end

end
