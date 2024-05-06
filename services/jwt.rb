require 'jwt'

class Jwt
  def self.encode(payload)
    JWT.encode payload, 'secret'
  end

  def self.decode(header)
    return unless header

    token = header.split(' ').last
    begin
      JWT.decode token, 'secret', true, { algorithm: 'HS256' }
    rescue JWT::DecodeError
      nil
    end
  end
end
