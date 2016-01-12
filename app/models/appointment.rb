class Appointment < ActiveRecord::Base
  #include Elasticsearch::Model
  #include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :event

  default_scope { order('created_at DESC') }

  enum payment: { 'Повна вартість 100грн'=> 100, 'Для студентів 70грн'=> 70, 'Без Харчування 40грн'=> 40, 'Не маю можливості заплатити'=> 0 }

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
