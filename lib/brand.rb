class Brand < ActiveRecord::Base
  has_and_belongs_to_many(:stores)
  validates(:name, :presence => true)
  validates(:name, :length => { :maximum => 100 })
  validates(:name, :uniqueness => true)
  validates(:price, :presence => true)
  before_create(:capitalize)


  def capitalize
    self.name = name.capitalize
  end

end
