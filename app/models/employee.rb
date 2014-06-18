class Employee
  include Mongoid::Document
  include Mongoid::Orderable

  field :name,      type: String

  orderable column: :serial_no, default: true
  orderable column: :pos, base: 0, as: :position

end
