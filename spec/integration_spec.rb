require "spec_helper"

describe("the store path", {:type => :feature}) do
  it("lets user create a store") do
    visit("/")
    click_link("Add Store")
    fill_in("store_name", :with => "Footlocker")
    click_button("Add Store")
    expect(page).to have_content("Footlocker")
  end
end

  describe("the brand path", {:type => :feature}) do
    it("lets user create a brand") do
      visit("/")
      click_link("Add Brand")
      fill_in("brand_name", :with => "Nike")
      fill_in("brand_price", :with => "50")
      click_button("Add Brand")
      expect(page).to have_content("Nike")
    end
end

describe("the store path", {:type => :feature}) do
  it("lets user update a store") do
    visit("/stores/1")
    fill_in("store", :with => "Finish Line")
    click_button("Update Store Name")
    expect(page).to have_content("Finish Line")
  end
end

describe("the brand path", {:type => :feature}) do
  it("lets user update a brand") do
    visit("/brands/1")
    fill_in("brand", :with => "Nike")
    click_button("Update Brand Name")
    expect(page).to have_content("Nike")
  end
end
