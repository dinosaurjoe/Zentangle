require 'pusher'

Pusher.app_id = '338148'
Pusher.key = ENV['PUSHER_BROWSER_KEY']
Pusher.secret = ENV['PUSHER_SECRET']
Pusher.cluster = 'eu'
Pusher.logger = Rails.logger
Pusher.encrypted = true
