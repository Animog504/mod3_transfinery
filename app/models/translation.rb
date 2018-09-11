require_relative: 'translation_event.rb'

class Translation < ApplicationRecord
  belongs_to: TranslationEvent

  def initialize(sl, rl, tbt)
    @startingLanguage = sl
    @resultLanguage = rl
    @tbtranslated = tbt
    @finalTranslation = ""
    @iterations = []
    # of back-and-forths: iterations.length
    TranslationEvent.iterations << self
  end

end
