require './src/const/app_const'
require './src/infrastructure/gmail_helper'

class SendEmailService
  def execute
    puts 'SendEmailServiceの処理を開始します'
    send_email('', 'test', 'Hello world')
    puts 'SendEmailServiceの処理を終了します'
  end

  private def send_email(to_address, subject, body)
    gmail = GmailHelper.new(to_address, subject, body)
    gmail.send_email
  end
end
