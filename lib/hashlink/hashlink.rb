# frozen_string_literal: true

require 'digest/sha2'
require 'multibases'
require 'multihashes'

module Hashlink
  def self.encode(
    data: '', urls: [], codecs: ['mh-sha2-256', 'mb-base58btc'], meta: {}
  )
    if data.empty? && urls.empty?
      raise 'Either `data` or `urls` must be provided.'
    end
    unless urls.empty?
      urls.each do |url|
        raise "URL #{url} must be a string." unless url.is_a? String
      end
      meta['url'] = urls
    end

    result = data
    codecs_dup = codecs.dup
    until codecs_dup.empty?
      codec = codecs_dup.shift.split('-')
      codec_encoder = codec.shift
      codec = codec.join('-')

      if codec_encoder == 'mh'
        result = Multihashes.encode(
          Digest::SHA256.digest(result), codec
        ).unpack('C*')
      elsif codec_encoder == 'mb'
        result = Multibases.pack(codec, result).to_s
      end
    end

    "hl:#{result}"
  end
end
