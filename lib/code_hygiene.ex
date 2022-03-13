defmodule CodeHygiene do
  @moduledoc """
  API for the application, all calls from the front-end should go thru
  this module vs directly calling into individual context modules.
  """
  use Boundary

  alias CodeHygiene.Products

  # ===========================================================================
  # Product specific functions
  # ===========================================================================
  defdelegate list_products, to: Products
  defdelegate get_product!(id), to: Products
  defdelegate create_product(attrs \\ %{}), to: Products
  defdelegate update_product(product, attrs), to: Products
  defdelegate delete_product(product), to: Products
  defdelegate change_product(product, attrs \\ %{}), to: Products
end
