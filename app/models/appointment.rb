class Appointment < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  belongs_to :event

  def as_indexed_json(options={})
    as_json(
      only: [:id, :notice],
      include: [ :user ]
    )
  end

  def self.search_with_elasticsearch(*args)
    __elasticsearch__.search(*args)
  end
end
