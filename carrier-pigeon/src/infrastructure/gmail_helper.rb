require 'mail'

class GmailHelper
  def initialize
    @mail = Mail.new
  end

  def with_from_address(from_address)
    @mail.from = from_address
    self
  end

  def with_to_address(to_address)
    @mail.to = to_address
    self
  end

  def with_subject(subject)
    @mail.subject = subject
    self
  end

  def with_body(body)
    @mail.body = body
    self
  end

  def send_email
    @mail.delivery_method(:smtp,
                          address: AppConst::SMTP_GMAIL_ADDRESS,
                          port: AppConst::SMTP_GMAIL_PORT,
                          domain: AppConst::SMTP_GMAIL_DOMAIN,
                          user_name: AppConst::SMTP_GMAIL_USER_NAME,
                          password: AppConst::SMTP_GMAIL_PASSWORD,
                          authentication: AppConst::SMTP_GMAIL_AUTHENTICATION,
                          enable_starttls_auto: AppConst::SMTP_GMAIL_ENABLE_STARTTLS_AUTO)
    @mail.charset = 'utf-8'
    @mail.deliver
  end
end
