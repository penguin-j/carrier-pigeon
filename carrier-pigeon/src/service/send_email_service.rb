require 'mail'
require './src/const/app_const'

class SendEmailService
  def execute
    puts 'SendEmailServiceの処理を開始します'
    send_email
    puts 'SendEmailServiceの処理を終了します'
  end

  private def send_email
    mail = Mail.new do
      from    AppConst::EMAIL_FROM_ADDRESS
      to      ''
      subject 'test'
      body    'Hello world'
    end

    mail.delivery_method(:smtp,
                         address: AppConst::SMTP_GMAIL_ADDRESS,
                         port: AppConst::SMTP_GMAIL_PORT,
                         domain: AppConst::SMTP_GMAIL_DOMAIN,
                         user_name: AppConst::SMTP_GMAIL_USER_NAME,
                         password: AppConst::SMTP_GMAIL_PASSWORD,
                         authentication: AppConst::SMTP_GMAIL_AUTHENTICATION,
                         enable_starttls_auto: AppConst::SMTP_GMAIL_ENABLE_STARTTLS_AUTO)
    mail.charset = 'utf-8'
    mail.deliver
  end
end
