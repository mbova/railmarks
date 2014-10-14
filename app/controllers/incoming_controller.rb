class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create

    puts "INCOMING PARAMS HERE: #{params}"
    # process various message parameters:
    sender  = params['from']
    subject = params['subject']

    # get the "stripped" body of the message, i.e. without
    # the quoted part
    actual_body = params["stripped-text"]

    # process all attachments:
    count = params['attachment-count'].to_i
    count.times do |i|
      stream = params["attachment-#{i+1}"]
      filename = stream.original_filename
      data = stream.read()
    end
    render :text => "OK"
    head 200
  end

end
