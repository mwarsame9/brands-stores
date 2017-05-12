require "spec_helper"

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("validates presence of store name") do
      name = Store.new({:name => ""})
      expect(name.save()).to(eq(false))
    end

  it("ensures store names are unique") do
      name1 = Brand.new(name: "Footlocker")
      name2 = Brand.new(name: "Footlocker")
      expect(name2.save()).to(eq(false))
    end

  it("capitalizes the store name before creating") do
      name = Store.create(name: "footlocker")
      expect(name.capitalize).to(eq("Footlocker"))
    end
end
