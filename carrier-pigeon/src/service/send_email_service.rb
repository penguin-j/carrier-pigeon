require './src/const/app_const'
require './src/infrastructure/gmail_helper'

class SendEmailService
  def initialize(req)
    @from_address = req[:from_address]
    @to_address = req[:to_address]
    @subject = req[:subject]
    @body = req[:body]
  end

  def execute
    puts 'SendEmailServiceの処理を開始します'
    send_email(@from_address, @to_address, @subject, @body)
    puts 'SendEmailServiceの処理を終了します'
  end

  private def send_email(from_address, to_address, subject, body)
    GmailHelper.new
               .with_from_address(from_address)
               .with_to_address(to_address)
               .with_subject(subject)
               .with_body(body)
               .send_email
  end
end
