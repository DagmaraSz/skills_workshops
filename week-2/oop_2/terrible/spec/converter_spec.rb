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
  end

  describe ".shouty_convert" do
    it "converts a string to a given type and makes it caps" do
      expect(converter.shouty_convert(:text)).to eq "EXAMPLE STRING"
      expect(converter.shouty_convert(:html)).to eq "<html><head></head><body>EXAMPLE STRING</body></html>"
      expect(converter.shouty_convert(:json)).to eq "{\"response\":\"EXAMPLE STRING\"}"
      expect(converter.shouty_convert(:xml)).to eq "<response>EXAMPLE STRING</response>"
    end
  end

  describe ".convert_location" do
    it "converts a string to ***" do
      expect(converter.convert_location).to eq "**************"
    end
  end
end
