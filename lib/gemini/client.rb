module Gemini
  class Client
    include Gemini::RestConnection
    include Gemini::WebsocketConnection
    include Gemini::AuthenticatedConnection
    include Gemini::Configurable


    def initialize(api_key, secret)
      if config.api_version == 1
        extend Gemini::V1::TickerClient
        extend Gemini::V1::TradesClient
        extend Gemini::V1::FundingBookClient
        extend Gemini::V1::OrderbookClient
        extend Gemini::V1::StatsClient
        extend Gemini::V1::LendsClient
        extend Gemini::V1::SymbolsClient
        extend Gemini::V1::AccountInfoClient
        extend Gemini::V1::DepositClient
        extend Gemini::V1::OrdersClient
        extend Gemini::V1::PositionsClient
        extend Gemini::V1::HistoricalDataClient
        extend Gemini::V1::MarginFundingClient
        extend Gemini::V1::WalletClient
      else
        extend Gemini::V2::TickerClient
        extend Gemini::V2::StatsClient
        extend Gemini::V2::UtilsClient
        extend Gemini::V2::PersonalClient
        extend Gemini::V2::TradingClient
        extend Gemini::V2::MarginClient
      end

      @api_key = api_key
      @secret = secret
      
      @mutex = Mutex.new
      @c_counter = 1
    end
  end
end
