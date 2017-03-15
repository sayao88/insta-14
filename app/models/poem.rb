class Poem < ActiveResource::Base #ActiveRecord::Baseから変更する
    #self.site = "https://ancient-earth-48480.herokuapp.com" #基礎編１で公開したアプリのHerokuのURL
    include Her::Model
end
