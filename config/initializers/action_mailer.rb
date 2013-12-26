module ActionMailer
  class Base
    cattr_accessor :smtp_config

    self.smtp_config = YAML::load(File.open("#{Rails.root}/config/mailer.yml"))[Rails.env]

    def self.smtp_settings
      mailer = self.smtp_config
      @@smtp_settings = mailer.symbolize_keys
    end

  end
end