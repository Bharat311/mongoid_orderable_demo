class Employee
  include Mongoid::Document
  include Mongoid::Orderable

  field :serial_no, type: Integer
  field :name, type: String

  orderable

end
