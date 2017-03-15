class Journal < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  has_attached_file :image, styles: { large: "940x623#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
