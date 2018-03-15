defmodule DomainTest do
  use ExUnit.Case

  test "widget_code is functionally a gizmo_code" do
    m = "test"
    assert widget(m) == gizmo(m)
  end

  test "product_code can be a gizmo_code or a widget_code" do
    m = "test"
    p = product(m)
    assert (^p = widget(m) <> gizmo(m))
  end

  test "order_quantity can be a float or a number" do
    assert 1 = order(1)
    assert 2.0 = order(0, 1.0)
  end

  @spec widget(String.t) :: OrderTaking.Domain.widget_code
  def widget(message) do
    message
  end

  @spec gizmo(String.t) :: OrderTaking.Domain.gizmo_code
  def gizmo(message) do
    message
  end

  @spec product(String.t) :: OrderTaking.Domain.product_code
  def product(message) do
    widget(message) <> gizmo(message)
  end

  @spec order(OrderTaking.Domain.unit_quantity, OrderTaking.Domain.kilogram_quantity) :: OrderTaking.Domain.order_quantity
  def order(unit_quantity \\ 0, kilogram_quantity \\ 0.0)
  def order(unit_quantity, 0.0) do unit_quantity end
  def order(0, kilogram_quantity) do kilogram_quantity * 2 end
end
