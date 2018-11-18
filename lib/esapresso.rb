require "esapresso/version"

require "erb"

module Esapresso
  class << self
    def generate
      template = File.read(File.expand_path("../templates/template.md.erb", __dir__))
      erb = ERB.new(template, 0, "%-")

      reports = {}

      p title = daily_report_title
      p body = result(erb, reports)

    end

    def result(erb, reports)
      erb.result(binding)
    end

    def user_name
      "tsu-nera".freeze  # TODO 環境変数からユーザ名を取得
    end

    def daily_report_title
      Time.now.strftime("日報_%Y%m%d_#{user_name}").to_s
    end
  end
end
