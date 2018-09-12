# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).


# Translation.destroy_all
# TranslationEvent.destroy_all


# OUR OBJECTS ARE TRANSLATION_EVENTS and TRANSLATIONS
# A TRANSLATION_EVENT CONTAINS TRANSLATIONS

# <----------------Translations ------------------->

tHello_iterations= []

# 0. hello-annyounghaseyo
# 1. annyounghaseyo-howareyou
# 2. howareyou-annyoung
# 3. annyoung-hello

tHello_iterations << Translation.new('en','ko','hello','annyounghaseyo') #hello-annyounghaseyo-translations[0]

# tHello_iterations << Translation.create(from: 'ko', to: 'en', origin: tHello_iterations[0].text, text: 'how are you') #annyounghaseyo-howareyou-translations[1]

# tHello_iterations << Translation.create(from: 'en', to: 'ko', origin: tHello_iterations[1].text, text: 'annyoung') #howareyou-annyoung-translations[2]

# tHello_iterations << Translation.create(from: 'ko', to: 'en', origin: tHello_iterations[2].text, text: 'hello') #annyoung-hello-translations[3]


# # 4. konnichiwa-hello
# # 5. hello-konnichiwa
# # 6 .konnichiwa-hello

# tKonnichiwa_iterations = []
# tKonnichiwa_iterations<< Translation.create(from: 'jp', to: 'en', origin: 'hello', text: 'annyounghaseyo') #hello-annyounghaseyo-tKonnichiwa_iterations[0]

# tKonnichiwa_iterations<<  Translation.create(from: 'en', to: 'jp', origin: tKonnichiwa_iterations[0].text, text: 'how are you') #annyounghaseyo-howareyou-tKonnichiwa_iterations[1]

# tKonnichiwa_iterations<< Translation.create(from: 'jp', to: 'en', origin: tKonnichiwa_iterations[1].text, text: 'annyoung') #howareyou-annyoung-tKonnichiwa_iterations[2]

# # <----------------Translation Event ------------------->

# tHello = TranslationEvent.create(from: tHello_iterations.first.from, to: tHello_iterations.first.to, origin: tHello_iterations.first.origin, iterations: tHello_iterations, text: tHello_iterations.last.text)

# tKonnichiwa = TranslationEvent.create(from: tKonnichiwa_iterations.first.from, to: tKonnichiwa_iterations.first.to, origin: tKonnichiwa_iterations.first.origin, iterations: tKonnichiwa_iterations, text: tKonnichiwa_iterations.last.text)
