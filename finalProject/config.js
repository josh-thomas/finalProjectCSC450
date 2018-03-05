module.exports = {

// Connects to my twitter Account
  twitter: {
    consumer_key        :  '',
    consumer_secret     :  '',
    access_token        :  '',
    access_token_secret :  '',
  },

//Connects to my Pusher Account
  pusher: {
    appId      : '',
    key        : '',
    secret     : '',
    encrypted  : true,
  },

  hashtagsToTrack: ['#nodejs', '#swift', '#ios', '#programming', '#compsci450', '#andovercompsci'],

  channel: 'hashtags',

  event: 'new_tweet',
}
