require("bundler/setup")
Bundler.require(:default)
require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get("/") do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

get("/brands") do
  @brands = Brand.all()
  erb(:brands)
end

get("/stores") do
  @stores = Store.all()
  erb(:stores)
end

post("/brands") do
  name = params.fetch("brand_name")
  price = params.fetch("brand_price")
  Brand.create({:name => name, :price => price})
  redirect("/")
end

post("/stores") do
  name = params.fetch("store_name")
  Store.create({:name => name})
  redirect("/")
end

get("/brands/:id") do
  @brand = Brand.find(params.fetch("id").to_i())
  @stores = Store.all()
  erb(:brand)
end

get("/stores/:id") do
  @store = Store.find(params.fetch("id").to_i())
  @brands = Brand.all()
  erb(:store)
end

patch("/brands/:id") do
  store = Store.find(params.fetch("store_id").to_i())
  @brand = Brand.find(params.fetch("id").to_i())
  @brand.stores.push(store)
  redirect back
end

patch("/stores/:id") do
  brand = Brand.find(params.fetch("brand_id").to_i())
  @store = Store.find(params.fetch("id").to_i())
  @store.brands.push(brand)
  redirect back
end


patch('/rename_store/:id') do
  name = params.fetch("store")
  @store = Store.find(params.fetch("id"))
  @store.update({name: name})
  @brands = Brand.all()
  erb(:store)
end

delete('/delete_store/:id') do
  @store = Store.find(params.fetch('id'))
  @store.delete
  @stores = Store.all()
  redirect("/")
end

patch('/rename_brand/:id') do
  name = params.fetch("brand")
  @brand = Brand.find(params.fetch("id"))
  @brand.update({name: name})
  @stores = Store.all()
  erb(:brand)
end

delete('/delete_brand/:id') do
  @brand = Brand.find(params.fetch('id'))
  @brand.delete
  @brands = Brand.all()
  redirect("/")
end
