# coding: utf-8
FactoryGirl.define do
  factory :activity do |f|
    f.name "Giornalino scuola"
    f.professor_id 2
    f.modality "La stesura del giornalino d'istituto è un'attività..."
    f.description "Il giornalino 'La Gazzetta della Scuola', giunto a..."
    f.img_url "giornalino.jpg"
  end

  factory :meeting do |f|
    f.id 1
    f.datetime "2014-06-03 09:13:00"
    f.location "aula 9"
    f.course_id 1
  end

  factory :course do |f|
    f.id 1
    f.name "1A"
    f.location "Piano 1, aula numero 10"
    f.books "La matematica è con noi - Zanichelli. History - La..."
    f.extra_materials "Per approfondimenti si può far riferimento al sito..."
    f.school_year_id 1
  end
end
