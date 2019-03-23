require 'faraday'

module Gemini
  class ClientError < Exception; end
  class ParamsError < ClientError; end
  class InvalidAuthKeyError < ClientError; end
  class BlockMissingError < ParamsError; end
  class ServerError < Exception; end # Error reported back by Binfinex server
  class ConnectionClosed < Exception; end
  class BadRequestError < ServerError; end
  class NotFoundError < ServerError; end
  class ForbiddenError < ServerError; end
  class UnauthorizedError < ServerError; end
  class InternalServerError < ServerError; end
  class WebsocketError < ServerError; end

  class CustomErrors < Faraday::Response::Middleware
    def on_complete(env)
      case env[:status]
      when 400
        raise BadRequestError, env.body['message']
      when 401
        raise UnauthorizedError, env.body['message']
      when 403
        raise ForbiddenError, env.body['message']
      when 404
        raise NotFoundError, env.body['message']
      when 500
        raise InternalServerError, env.body['message']
      when 503
        raise ServerError, env.body['message'] 
      else
        super
      end
    end
  end
end
