defmodule CodeHygieneFixtures.ProductsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CodeHygiene.Products` context.
  """
  use Boundary, check: [in: false, out: false]

  @doc """
  Generate a product.
  """
  def product_fixture(attrs \\ %{}) do
    {:ok, product} =
      attrs
      |> Enum.into(%{
        name: "some name",
        price: 42
      })
      |> CodeHygiene.Products.create_product()

    product
  end
end
