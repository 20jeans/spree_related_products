class Spree::Relation < ActiveRecord::Base
  belongs_to :relation_type
  belongs_to :relatable, polymorphic: true
  belongs_to :related_to, polymorphic: true

  validates :relation_type, :relatable, :related_to, presence: true

  def product_discount(product)
    where("discount_amount <> 0.0 AND relatable_type = ? AND relatable_id = ?", "Spree::Product", product.id)
  end
end
