require 'converter'

describe Converter do
  subject(:converter) { described_class.new(string) }
  let(:string) { "Example string" }

  describe '.convert' do
    it 'converts a string given a type' do
      expect(converter.convert(:text)).to eq "Example string"
      expect(converter.convert(:html)).to eq "<html><head></head><body>Example string</body></html>"
      expect(converter.convert(:json)).to eq "{\"response\":\"Example string\"}"
      expect(converter.convert(:xml)).to eq "<response>Example string</response>"
    end

    it 'raises an error given an unrecognised type' do
      expect { converter.convert(:garbage) }.to raise_error "Unrecognised type"
    end

    it "converts to upcase string given a type and style = upcase" do
      expect(converter.convert(:text, :upcase)).to eq "EXAMPLE STRING"
      expect(converter.convert(:html, :upcase)).to eq "<html><head></head><body>EXAMPLE STRING</body></html>"
      expect(converter.convert(:json, :upcase)).to eq "{\"response\":\"EXAMPLE STRING\"}"
      expect(converter.convert(:xml, :upcase)).to eq "<response>EXAMPLE STRING</response>"
    end

    it "converts to *** string given a type and style = sensitive" do
      expect(converter.convert(:text, :sensitive)).to eq " "
      expect(converter.convert(:html, :sensitive)).to eq "<html><head></head><body>EXAMPLE STRING</body></html>"
      expect(converter.convert(:json, :sensitive)).to eq "{\"response\":\"EXAMPLE STRING\"}"
      expect(converter.convert(:xml, :sensitive)).to eq "<response>EXAMPLE STRING</response>"
    end
  end
end
