defmodule CodeHygiene do
  @moduledoc """
  API for the application, all calls from the front-end should go thru
  this module vs directly calling into individual context modules.
  """
  use Boundary, deps: [CodeHygieneSchema], exports: [Accounts, Accounts.User]

  alias CodeHygiene.Products
  alias CodeHygieneSchema.Product

  # ===========================================================================
  # Product specific functions
  # ===========================================================================
  @spec list_products :: list(Product.t())
  defdelegate list_products, to: Products

  @spec get_product!(id :: pos_integer()) :: Product.t() | Ecto.NoResultsError
  defdelegate get_product!(id), to: Products

  @spec create_product(attrs :: map()) :: {:ok, Product.t()} | {:error, Ecto.Changeset.t()}
  defdelegate create_product(attrs \\ %{}), to: Products

  @spec update_product(product :: Product.t(), attrs :: map()) ::
          {:ok, Product.t()} | {:error, Ecto.Changeset.t()}
  defdelegate update_product(product, attrs), to: Products

  @spec delete_product(product :: Product.t()) ::
          {:ok, Product.t()} | {:error, Ecto.Changeset.t()}
  defdelegate delete_product(product), to: Products

  @spec change_product(product :: Product.t(), attrs :: map()) :: Ecto.Changeset.t()
  defdelegate change_product(product, attrs \\ %{}), to: Products
end
