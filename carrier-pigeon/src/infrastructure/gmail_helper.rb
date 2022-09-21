require 'mail'

class GmailHelper
  def initialize(from_address, to_address, subject, body)
    @from_address = from_address
    @to_address = to_address
    @subject = subject
    @body = body
  end

  def send_email
    mail = Mail.new
    mail.from    = @from_address
    mail.to      = @to_address
    mail.subject = @subject
    mail.body    = @body

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
