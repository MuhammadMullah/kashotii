defmodule Kashotii.Factory do
  @moduledoc false

  # with Ecto
  use ExMachina.Ecto, repo: Kashotii.Repo

  alias Kashotii.Links.Link

  def link_factory do
    %Link{
      original_url: Faker.Internet.domain_name(),
      identifier: Faker.String.base64()
    }
  end

  {:ok, _} = Application.ensure_all_started(:ex_machina)
end
