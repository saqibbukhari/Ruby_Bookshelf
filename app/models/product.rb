class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :title, :image_url, :price, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01, :message => ": Invalide price, it must be positive"}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
	:with => %r{\.(gif|jpg|png)$}i,
	:message => ': Must be either one of them (gif, jpg, png)'
  }
  default_scope :order => 'title'
  has_many :line_items
  before_destroy :ensure_line_item_not_referenced

  def ensure_line_item_not_referenced
	if line_items.empty?
		return true
	else
		errors.add(:base, 'Line Item is referenced')
		return false
	end
  end
	
end
