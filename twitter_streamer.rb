class TwitterStreamer
  def initialize(keys, params)
    @keys, @params = keys, params
  end

  def run
    init_options
    run_em
  end

  private
  attr_reader :keys, :params, :options

  def init_options
    @options = {
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

  def run_em
    EM.run do
      client = EM::Twitter::Client.connect(options)

      client.each do |result|
        parsed = JSON.parse(result)
        text = parsed['text']
        unless text.empty?
          puts text
        end
      end
    end
  end
end

