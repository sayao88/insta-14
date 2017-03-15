class Picture < ActiveRecord::Base
    validates :title, presence:true
    belongs_to :user # userモデルに属する

    mount_uploader :img, ImgUploader
end
