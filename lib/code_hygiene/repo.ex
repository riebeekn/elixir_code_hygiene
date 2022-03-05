defmodule CodeHygiene.Repo do
  use Ecto.Repo,
    otp_app: :code_hygiene,
    adapter: Ecto.Adapters.Postgres
end
