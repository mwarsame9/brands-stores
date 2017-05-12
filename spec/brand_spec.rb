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

  it("ensures brand names are unique") do
      name1 = Brand.new(name: "Nike")
      name2 = Brand.new(name: "Nike")
      expect(name2.save()).to(eq(false))
    end

  it("capitalizes the brand name before creating") do
      name = Brand.create(name: "nike")
      expect(name.capitalize).to(eq("Nike"))
    end

  it("validates presence of brand price") do
      price = Brand.new({:name => ""})
      expect(price.save()).to(eq(false))
    end

end
