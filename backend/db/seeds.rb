# t.string :from
# t.string :to
# t.string :origin
# t.string "iterations", array: true

TranslationEvent.create(from:"en",to:"ja",origin:"hello",iterations:["a","b","c"])





# # This file should contain all the record creation needed ResultingLanguage seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#
# # Translation.destroy_all
# # TranslationEvent.destroy_all
#
#
# # OUR OBJECTS ARE TRANSLATION_EVENTS and TRANSLATIONS
# # A TRANSLATION_EVENT CONTAINS TRANSLATIONS
#
# # <----------------Translations ------------------->
#
# tHello_iterations= []
#
# # 0. hello-annyounghaseyo
# # 1. annyounghaseyo-howareyou
# # 2. howareyou-annyoung
# # 3. annyoung-hello
#
# event = TranslationEvent.create(
#   StartingLanguage: 'en',
#   ResultingLanguage: 'ko',
#   Original: 'hello',
#   Result: 'annyounghaseyo'
# )
#
# tHello_iterations << Translation.create(StartingLanguage: 'en', ResultingLanguage: 'ko', Original: 'hello',Result: 'annyounghaseyo', translation_event: event) #hello-annyounghaseyo-translations[0]
#
# # tHello_iterations << Translation.create(StartingLanguage: 'ko', ResultingLanguage: 'en', Original: tHello_iterations[0].Result, Result: 'how are you') #annyounghaseyo-howareyou-translations[1]
#
# # tHello_iterations << Translation.create(StartingLanguage: 'en', ResultingLanguage: 'ko', Original: tHello_iterations[1].Result, Result: 'annyoung') #howareyou-annyoung-translations[2]
#
# # tHello_iterations << Translation.create(StartingLanguage: 'ko', ResultingLanguage: 'en', Original: tHello_iterations[2].Result, Result: 'hello') #annyoung-hello-translations[3]
#
#
# # 0. konnichiwa-hello
# # 1. hello-konnichiwa
# # 2 .konnichiwa-hello
#
# tKonnichiwa_iterations = []
#
# tKonnichiwa_iterations<< Translation.create(StartingLanguage: 'jp', ResultingLanguage: 'en', Original: 'hello', Result: 'annyounghaseyo') #hello-annyounghaseyo-tKonnichiwa_iterations[0]
#
# tKonnichiwa_iterations<<  Translation.create(StartingLanguage: 'en', ResultingLanguage: 'jp', Original: tKonnichiwa_iterations[0].Result, Result: 'how are you') #annyounghaseyo-howareyou-tKonnichiwa_iterations[1]
#
# tKonnichiwa_iterations<< Translation.create(StartingLanguage: 'jp', ResultingLanguage: 'en', Original: tKonnichiwa_iterations[1].Result, Result: 'annyoung') #howareyou-annyoung-tKonnichiwa_iterations[2]
#
# # # <----------------Translation Event ------------------->
#
# # tHello = TranslationEvent.create(StartingLanguage: tHello_iterations.first.StartingLanguage, ResultingLanguage: tHello_iterations.first.ResultingLanguage, Original: tHello_iterations.first.Original, iterations: tHello_iterations, Result: tHello_iterations.last.Result)
#
