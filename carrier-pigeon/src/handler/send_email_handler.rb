require 'json'
require './src/service/send_email_service'

def execute(event:, context:)
  SendEmailService.new.execute
end
