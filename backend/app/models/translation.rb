require_relative: 'translation_event.rb'

class Translation < ApplicationRecord
  belongs_to: TranslationEvent

  def initialize(sl, rl, tbt)
    @startingLanguage = sl
    @resultLanguage = rl
    @tbtranslated = tbt
    TranslationEvent.iterations << self
  end

end
