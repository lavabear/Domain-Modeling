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
    assert 2.0 = order_f(1.0)
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

  @spec order(integer) :: OrderTaking.Domain.order_quantity
  def order(t) do
    t
  end

  @spec order_f(float) :: OrderTaking.Domain.order_quantity
  def order_f(t) do
    t * 2
  end
end
