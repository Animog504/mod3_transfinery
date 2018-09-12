class TranslationsController < ApplicationController

  def translate
    variable.translate params[:origin], to: params[:to]
  end
end
