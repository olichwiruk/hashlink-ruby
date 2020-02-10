require 'spec_helper'
require 'hashlink'

RSpec.describe Hashlink do
  describe '.encode' do
    context 'when input is a file' do
      let(:data) do
        File.read("#{SPEC_PATH}/shared/example.json")
      end

      it 'reutrns hashlink for input' do
        hashlink = described_class.encode(data: data)
        expect(hashlink).to eql(
          'hl:zQmQoJKSchiwRfCErWtEjceMiD82NEwCDKUuUxcLhcnTzXz'
        )
      end
    end
  end
end
