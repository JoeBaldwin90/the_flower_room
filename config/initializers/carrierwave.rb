CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider:              'AWS',
    aws_access_key_id:     Rails.application.credentials.aws_key,
    aws_secret_access_key: Rails.application.credentials.aws_password,
    region:                'eu-west-2',
  }
  config.fog_directory  = Rails.application.credentials.aws_bucket
end
