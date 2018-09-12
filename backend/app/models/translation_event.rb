class TranslationEvent < ApplicationRecord
  has_many :translations

  # attr_reader :
  # attr_writer :
  @@all = []

  # def initialize()
  #   # @from = translations.first.from
  #   # @to = translations.first.to
  #   # @origin = translations.first.origin
  #   @iterations = [] #translations
  #   # @text = translations.last.text
  #   @@all << self
  # end

  def all()
    @@all
  end

end
