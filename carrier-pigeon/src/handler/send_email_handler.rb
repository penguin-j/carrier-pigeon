require 'json'
require './src/service/send_email_service'

def execute(event:, context:)
  body = to_snake_case_keys(event['body'])
  SendEmailService.new(body).execute
end

private def to_snake_case_keys(hash)
  hash.transform_keys { |k| to_snake_case(k) }
end

private def to_snake_case(str)
  str.gsub(/[A-Z]/) { |s| s = "_#{s.downcase}" }
end
