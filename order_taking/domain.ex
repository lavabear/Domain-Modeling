defmodule OrderTaking.Domain do
  @moduledoc false

  # Product Code Related
  @typedoc """
  Starts with W then 4 digits
  """
  @type widget_code :: {String.t}

  @typedoc """
  Starts with G then 3 digits
  """
  @type gizmo_code :: {String.t}

  @type product_code :: widget_code | gizmo_code

  # Order Quantity Related
  @type unit_quantity :: {integer}

  @type kilogram_quantity :: {float}

  @type order_quantity :: unit_quantity | kilogram_quantity

  @type undefined :: {any}

  @type order_id :: {undefined}
  @type order_line_id :: {undefined}
  @type customer_id :: {undefined}

  @type customer_info :: {undefined}
  @type shipping_address :: {undefined}
  @type billing_address :: {undefined}
  @type price :: {undefined}
  @type billing_amount :: {undefined}

  @type order :: {order_id, customer_id, shipping_address, billing_address, order_lines, billing_amount}

  @type order_line :: {order_line_id, order_id, product_code, order_quantity, price}
end
