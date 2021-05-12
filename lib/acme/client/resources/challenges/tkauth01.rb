# frozen_string_literal: true

class Acme::Client::Resources::Challenges::TKAUTH01 < Acme::Client::Resources::Challenges::Base
  CHALLENGE_TYPE = 'tkauth-01'.freeze

  def request_validation(spc_token:)
    assign_attributes(**send_challenge_validation(
      url: url, spc_token: spc_token
    ))
    true
  end

  private

  def send_challenge_validation(url:, spc_token:)
    @client.request_challenge_validation(
      url: url, payload: {ATC: spc_token}
    ).to_h
  end

end
