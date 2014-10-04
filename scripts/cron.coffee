# Description:
#   Utility commands surrounding Hubot uptime.
#
# Commands:


CronJob = require("cron").CronJob
request = require("request")

module.exports = (robot) ->

  robot.respond /cron ping/i, (msg) ->

    job = new CronJob "* */15 * * * *", ->
      msg.http("http://fathomless-garden-6223.herokuapp.com/hubot/ping")
        .post() (err, res, body) ->
          console.log(body)
      # console.log "CRON"
    , ->
      console.log "Job has ended"
    , true

    # console.log job

    msg.send "Cron has been started to hit /hubot/ping every 15 minutes"
