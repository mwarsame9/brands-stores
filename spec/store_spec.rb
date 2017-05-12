require "spec_helper"

describe(Store) do
  it { should have_and_belong_to_many(:brands) }

  it("validates presence of store name") do
      name = Store.new({:name => ""})
      expect(name.save()).to(eq(false))
    end
end
