require 'json'
require './src/service/send_email_service'

def execute(event:, context:)
  body = to_snake_case(event['body'])
  SendEmailService.new(body).execute
end

private def to_snake_case(body)
  {
    'from_address' => body['fromAddress'],
    'to_address' => body['toAddress'],
    'subject' => body['subject'],
    'body' => body['body']
  }
end
