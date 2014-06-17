class Employee
  include Mongoid::Document
  include Mongoid::Orderable

  field :name,      type: String

  orderable column: :serial_no
  orderable base: 0

end
