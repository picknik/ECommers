class Category < ActiveRecord::Base

  has_and_belongs_to_many :products

  before_save :prepare_strings

  has_attached_file :picture, styles: { medium: "300x300>", thumb: "100x100>" },
                              default_url: "/images/:style/missing.png"

  validates :name, presence: true,
                   length: { maximum: 128 },
                   uniqueness: { case_sensitive: false }

  validates :description, presence: true

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :picture, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]

  private

    def prepare_strings
      self.name.downcase!
      self.description.capitalize!
    end
end
