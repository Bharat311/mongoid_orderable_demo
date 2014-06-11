class EmployeesController < ApplicationController

  def index
    @employees = Employee.asc(:position)
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def create
    @employee = Employee.new(params[:employee])

    if @employee.save
      redirect_to employees_url, notice: 'Employee was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @employee = Employee.find(params[:id])

    if @employee.update_attributes(params[:employee])
      redirect_to @employee, notice: 'Employee was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    @employee.destroy

    redirect_to employees_url
  end

  def reorder
    @employee = Employee.find(params[:id])
    @employee.move_to! params[:order]

    redirect_to employees_url
  end

  def move
    @employee = Employee.find(params[:employee_id])
    @employee.move_to! params[:position].to_i

    redirect_to employees_url
  end

  def list
    @employee = Employee.find(params[:employee_id])
    @list = case params[:list].to_sym
            when :next     then @employee.next_item
            when :all_next then @employee.next_items
            when :prev     then @employee.previous_item
            when :all_prev then @employee.previous_items
            end.to_a
  end

end
