class TranslationEvent < ApplicationRecord
  has_many :translations

  # attr_reader :
  # attr_writer :
  @@all = []

  def initialize(sl, rl, tbt)
    @from = sl 
    @to = rl
    @origin = tbt
    @iterations = [] # of back-and-forths: iterations.length
    @text = ""
    @@all << self
  end

  def all()
    @@all
  end

end
