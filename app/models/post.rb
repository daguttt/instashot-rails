class Post < ApplicationRecord
  has_one_attached :image

  before_validation :modify_default_title

  validates :title, presence: true, length: { maximum: 255 }
  validates :description, length: { maximum: 10000 }
  validates :image, presence: true

  validate :image_size_and_type

  attribute :title, :string, default: "Untitled"

  private

  def modify_default_title
    return unless self.title == "Untitled"

    prompts_untitled = self.class.where("title LIKE 'Untitled%'").count
    self.title = "Untitled #{prompts_untitled + 1}" if self.title == "Untitled"
  end

  def image_size_and_type
    image = self.image
    # Type
    if [ "image/jpeg", "image/png", "image/webp" ].exclude?(image.content_type)
      errors.add(:image, :wrong_type)
    end

    # Size
    if image.byte_size > 5.megabyte
      errors.add(:image, :wrong_size)
    end
  end
end
