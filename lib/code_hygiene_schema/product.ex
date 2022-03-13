defmodule CodeHygieneSchema.Product do
  @moduledoc """
  The products schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  @type t :: %__MODULE__{
          name: String.t(),
          price: integer()
        }

  schema "products" do
    field :name, :string
    field :price, :integer

    timestamps()
  end

  @doc false
  def changeset(product, attrs) do
    product
    |> cast(attrs, [:name, :price])
    |> validate_required([:name, :price])
  end
end
