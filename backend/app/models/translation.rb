class Translation < ApplicationRecord
  belongs_to :translation_event

  def initialize(sl, rl, tbt, text)
    @from = sl
    @to = rl
    @origin = tbt
    @text = text
    #TranslationEvent.iterations << self
  end

end
