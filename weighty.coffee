Alexa = require("alexa-sdk")

module.exports = (event,context) ->
  handlers = {
    "GetWeight": () ->
      @emit(":tell", "Get Weight")
    "SetWeight": () ->
      @emit(":ask", "What is your weight today?", "What is your weight?")
    "Unhandled": () ->
      console.log "** Unhandled event"
      @emit(":tell", "Unhandled error occurred")
  }

  console.log 'Received event:', JSON.stringify(event, null, 2)
  alexa = Alexa.handler(event, context)
  alexa.dynamoDBTableName = "WeightySession"
  alexa.registerHandlers handlers
  alexa.execute()