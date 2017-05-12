require "spec_helper"

describe(Brand) do
  it { should have_and_belong_to_many(:stores) }

  it("validates presence of brand name") do
        name = Brand.new({:name => ""})
        expect(name.save()).to(eq(false))
      end

  it("ensures brand names to have a maximum of one hundred characters") do
      name = Brand.new({:name => "a".*(101)})
      expect(name.save()).to(eq(false))
    end

end
