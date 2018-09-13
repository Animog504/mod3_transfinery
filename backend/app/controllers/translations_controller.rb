class TranslationsController < ApplicationController

  # def translate
  #   variable.translate params[:origin], to: params[:to]
  # end

  def plsWork
    #dont forget to grab params
    translate = Google::Cloud::Translate.new project: "transfinery"
    text = params[:origin]
    language_code = params[:to]
    translation = translate.translate text, to: language_code

    render json: translation
  end
end
