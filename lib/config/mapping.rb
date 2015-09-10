collection :children do
  entity Child
  repository ChildRepository

  attribute :id, Integer
  attribute :name, String
  attribute :birthdate, Date
  attribute :age, Integer
end
