class PictureMailer < ApplicationMailer
  def picture_mail(picture)
    @picture = picture
    mail to: @picture.user.email, subject:"Pictureの投稿の確認のメール"
  end
end
