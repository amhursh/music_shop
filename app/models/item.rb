class Item < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, :price, :category_id, presence: true

  belongs_to :category
  has_many :orders_items
  has_many :orders, through: :orders_items

  enum status: %w(active retired)

  has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }, :default_url => "https://heuft.com/upload/image/400x267/no_image_placeholder.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_attached_file :audio
  validates_attachment_content_type :audio, :content_type => /.*/

  def formatted_price
    sprintf('%.2f', price)
  end

end
