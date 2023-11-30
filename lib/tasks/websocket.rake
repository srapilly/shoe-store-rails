# frozen_string_literal: true

namespace :websocket do
  def websocket_client
    ws = Faye::WebSocket::Client.new(Rails.configuration.websocket['host'])
    ws.on :open do
      p :open
    end
    ws.on :message do |event|
      event = JSON.parse(event.data)
      p event
      SalesEvent.create!(event)
    end

    ws.on :close do
      p :close
      # Try to open websocket connexion every second
      EM.add_timer(1) { client }
    end
  end

  task read_events: :environment do
    EM.run do
      websocket_client
    end
  end
end
