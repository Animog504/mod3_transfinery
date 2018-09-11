class TranslationEvent < ApplicationRecord
  has_many: Translation 

  # attr_reader :
  # attr_writer :
  @@all = []

  def initialize(sl, rl, tbt)
    @startingLanguage = sl
    @resultLanguage = rl
    @tbtranslated = tbt
    @finalTranslation = ""
    @iterations = []
    # of back-and-forths: iterations.length
    # @@all << self
  end

end
