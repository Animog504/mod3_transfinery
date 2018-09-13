Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #in JS: fetch(/transfinery/translate)
  get '/transfinery/translate', to: 'translations#plsWork'
  #post '/translate/:origin/:to', to: 'translations#translate'
  # get '/translate/:origin/:to/:from'
#ourURL.com/translate?lang=blah
#fetch(`ourURL.com/translate?${var1}=)
end
