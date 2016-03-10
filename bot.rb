# use karl's chat-adapter library
require 'chat-adapter'
# also use the local HerokuSlackbot class defined in heroku.rb
require './heroku'

# if we're on our local machine, we want to test our bot via shell, but when on
# heroku, deploy the actual slackbot.
# 
# Feel free to change the name of the bot here - this controls what name the bot
# uses when responding.
if ARGV.first == 'heroku'
  bot = HerokuSlackAdapter.new(nick: 'janet')
else
  bot = ChatAdapter::Shell.new(nick: 'janet')
end

# Feel free to ignore this - makes logging easier
log = ChatAdapter.log

# Do this thing in this block each time the bot hears a message:
bot.on_message do |message, info|
  # ignore all messages not directed to this bot
  unless message.start_with? '@janet '
    next # don't process the next lines in this block
  end

  # answer the query!
  # this bot simply echoes the message back
  "You're fired."
end

# actually start the bot
bot.start!
