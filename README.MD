# Rails ile Film Veritabanı Uygulaması - 3

Bu ödev, [bir önceki ödevde](https://github.com/railsakademi/odev-03crud) yaptığımız Rails projesinin devamıdır.

## Yapılması Gerekenler

- `User` modelini kullanarak Devise[1] kurulumu.
  - Tüm sayfaların navbarında eğer kullanıcı giriş yapmadıysa `Giriş Yap` ve `Kayıt Ol` linklerini, eğer kullanıcı giriş yaptıysa kullanıcının eposta adresini göstermek.
- Giriş yapmış kullanıcıların, filmlere + ve - oy verebilmesi.
  - Bunun için `Rating` modeli oluşturun, `movie_id, user_id, point` fieldları olan.(`has_many through` ilişkisi). - için point -1, + için point 1 olmalı.
  - Film sayfasında o film için verilmiş oyların toplamını gösterin.(+ ve - pointlerin toplamı).
  - User sayfasında(`users/:id`) kullanıcının oy verdiği filmleri gösterin.
- `Category` modeli ekleyin, filmler birden fazla kategoriye ait olabilir. Bir kategoride birden fazla kategori olabilir. (`HABTM` ilişkisi)
  - `movies#edit` sayfasında checkboxlar ile filmin ait olduğu kategoriler seçilebilmeli
  - `Category` modeli için `CRUD`. Category show sayfasında kategoriye ait olan filmleri listeleyin.
- Anasayfada en çok puan almış 10 filmi sıralayarak listeleyin.(Filmin puanı -> + ve - oyların toplamı )

## Başlangıç

**Gerekli Rails versiyonu: 4.2.5.2**

1. Bu repo'yu kendi GitHub hesabınıza forklayın.
2. Git clone ile projeyi bilgisayarınıza kopyalayın.
3. Ödevi tamamladıktan sonra kendi reponuza pushlayın.
4. Ödevi teslim etmek için bu repoya pull-request gönderin.

## Linkler

1. https://github.com/plataformatec/devise
