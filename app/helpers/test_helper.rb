
#encoding: utf-8

require 'open-uri'


module TestHelper

  def notice_message
    alert_types = { notice: :success, alert: :danger }
    close_button_options = { class: "close", "data-dismiss" => "alert", "aria-hidden" => true }
    close_button = content_tag(:button, "×", close_button_options)
    alerts = flash.map do |type, message|
      alert_content = close_button + message
      alert_type = alert_types[type.to_sym] || type
      alert_class = "alert alert-#{alert_type} alert-dismissable"
      content_tag(:div, alert_content, class: alert_class)
    end
    alerts.join("\n").html_safe
  end

  def aaa
    uri = URI("http://www.weblio.jp/content/%E6%99%82")
    response = open(uri, "r:utf-8").read.encode("utf-8", :invalid => :replace, :undef => :replace)
    #response.index('訓読')
    key = response[response.index('<li>訓読み：'),40]
    endPos = key[8..32].index('</li>')
    hiragana = key[8..8+endPos-1]
    #response.body

    #hresponse.body

  end


end
