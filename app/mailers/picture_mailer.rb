class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: "ibitomohiro@gmail.com", subject:"Pictureの投稿の確認のメール"
  end
end
