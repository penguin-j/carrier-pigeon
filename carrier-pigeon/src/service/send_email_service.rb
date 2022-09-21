require './src/const/app_const'
require './src/infrastructure/gmail_helper'

class SendEmailService
  def initialize(req)
    @from_address = req['from_address']
    @to_address = req['to_address']
    @subject = req['subject']
    @body = req['body']
  end

  def execute
    puts 'SendEmailServiceの処理を開始します'
    send_email(@from_address, @to_address, @subject, @body)
    puts 'SendEmailServiceの処理を終了します'
  end

  private def send_email(from_address, to_address, subject, body)
    gmail = GmailHelper.new(from_address, to_address, subject, body)
    gmail.send_email
  end
end
