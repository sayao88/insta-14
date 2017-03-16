class PicturesController < ApplicationController
    # ログインしているかをチェック,ログインしていない場合はブログにアクセスさせない
    before_action :authenticate_user!
    before_action :set_picture, only: [:edit, :update ,:destroy]

    def index
        @pictures = Picture.all
        # binding.pry # ブレークポイントを作成
        # raise
    end

    def new
        @picture = Picture.new
    end

    def create
        @picture = Picture.create(pictures_params)
        @picture.user_id = current_user.id # deviceのメソッドを使って値を取得して@picture.user_idとしてsaveする
        if @picture.save
            redirect_to root_path, notice:"Photo listを追加しました！" #ここにリダイレクトされる
            #NoticeMailer.sendmail_blog(@picture).deliver #メール送信
        else
            render action: 'new'
        end
    end

    def edit
        # @picture = Picture.find(params[:id]) はbeforefilterで実行
    end

    def update
        # @picture = Picture.find(params[:id]) はbeforefilterで実行
        @picture.update(pictures_params)
        if @picture.save
          redirect_to root_path, notice:"Photo listを更新しました！"
        else
          render action: "edit"
        end
    end

    def destroy
        # @picture = Picture.find(params[:id]) はbeforefilterで実行
        @picture.destroy
        redirect_to root_path, notice:"Photo listを削除しました！"
    end

    private
        def pictures_params
          params.require(:picture).permit(:title, :content, :img, :img_cache)
        end

        # メソッドはアクション（routing）で呼ばれるわけではないため、private句の中に定義
        def set_picture
          @picture = Picture.find(params[:id])
        end

end
