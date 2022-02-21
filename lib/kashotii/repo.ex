defmodule Kashotii.Repo do
  use Ecto.Repo,
    otp_app: :kashotii,
    adapter: Ecto.Adapters.Postgres
end
