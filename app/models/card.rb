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
    :other
  ]

  enum part_of_speech: ENUM_PART_OF_SPEECH

end
