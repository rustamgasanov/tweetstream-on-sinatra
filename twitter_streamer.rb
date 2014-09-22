class TwitterStreamer
  def initialize(keys, params)
    @keys, @params = keys, params
  end

  def run
    run_em
  end

  private
  attr_reader :keys, :params

  def options
    @options ||= {
      :path   => '/1/statuses/filter.json',
      :params => params,
      :oauth  => {
        :consumer_key     => keys['consumer_key'],
        :consumer_secret  => keys['consumer_secret'],
        :token            => keys['oauth_token'],
        :token_secret     => keys['oauth_secret']
      }
    }
  end

  def logger
    @logger ||= Logger.new('twitter_streamer.log', 1, 100_000)
  end

  def run_em
    EM.run do
      client = EM::Twitter::Client.connect(options)

      client.each do |result|
        parsed = JSON.parse(result)
        text = parsed['text']
        unless text.empty?
          puts text
          logger.info(text)
        end
      end
    end
  end
end
