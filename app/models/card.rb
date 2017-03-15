class Card < ActiveRecord::Base
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :body, presence: true

  ENUM_PART_OF_SPEECH = [
    :noun,
    :verb,
    :adjective,
    :adverb,
    :pronoun,
    :preposition,
    :conjunction,
    :phrase,
    :idiom,
    :other
  ]

  enum part_of_speech: ENUM_PART_OF_SPEECH

  has_attached_file :image, styles: { medium: "600x400#", small: "300x200#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

end
