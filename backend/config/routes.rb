Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  post '/translate/:origin/:to', to: 'translations#translate'
#ourURL.com/translate?lang=blah
#fetch(`ourURL.com/translate?${var1}=)
end
