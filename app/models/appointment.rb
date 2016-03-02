class Appointment < ActiveRecord::Base
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :event
  has_many :children, dependent: :destroy
  accepts_nested_attributes_for :children, allow_destroy: true

  validates_presence_of :level
  default_scope { order('created_at DESC') }

  enum payment: { 'Повна вартість 100грн'=> 100, 'Для студентів 70грн'=> 70, 'Інше (написати у примітках)'=> 0 }
  enum level: { 'Вперше на Школу Марії (0а)'=> 1, 'Вдруге на Школу Марії (0б зима)'=> 2, 'Вдруге або втретє на Школу Марії (0б весна)'=> 3, '1'=> 4, '2'=> 5, '3'=> 6  }

#   def as_indexed_json(options={})
#     as_json(
#       only: [:id, :notice],
#       include: [ :user ]
#     )
#   end

#   def self.search(query)
#   __elasticsearch__.search(
#     {
#       query: {
#         query_string: {
#           query: "*#{query}"
#         }
#       }
#     }
#   )
# end

  # settings index: { number_of_shards: 1 } do
  #   mappings dynamic: 'false' do
  #     indexes :notice, analyzer: 'english'
  #   end
  # end

  # def self.search_with_elasticsearch(*args)
  #   __elasticsearch__.search(*args)
  # end
end
