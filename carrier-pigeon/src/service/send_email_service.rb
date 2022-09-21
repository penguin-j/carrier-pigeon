require './src/const/app_const'
require './src/infrastructure/gmail_helper'

class SendEmailService
  def execute(req)
    puts 'SendEmailServiceの処理を開始します'
    send_email(req['from_address'], req['to_address'], req['subject'], req['body'])
    puts 'SendEmailServiceの処理を終了します'
  end

  private def send_email(from_address, to_address, subject, body)
    gmail = GmailHelper.new(from_address, to_address, subject, body)
    gmail.send_email
  end
end
