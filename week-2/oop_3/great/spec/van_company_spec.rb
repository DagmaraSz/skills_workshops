require 'van_company'

describe VanCompany do
  subject(:van_company) { described_class.new }

  describe '#handle_pickup' do
    it 'picks a driver' do
      van_company.pick_a_driver
      expect(VanCompany::DRIVER_LIST).to include(van_company.van_driver)
    end

    xit 'delegates van hire to the hire company' do
      van_company.hire_van
      expect(van_company.van).to eq van
    end
  end
end
