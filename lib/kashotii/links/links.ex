defmodule Kashotii.Links do
  @moduledoc """
    Links context
  """
  alias Kashotii.Repo
  alias Kashotii.Links.Link


  @doc """
    Get a single link by their original url

    ## Examples
        iex> get_by_orginal("https://google.com")
        %Link{}
  """
  def get_by_original_url(original_url), do: Repo.get_by(Link, original_url: original_url)


  @doc """
    Create a new link

    ## Examples
        iex> create_link(%{"original_url" => "https://google.com"})
        {:ok, %Link{}}
        iex> create_link(%{"original_url" => bad_value})
        {:error, %Ecto.Changeset{}}
  """

  def create_link(%{"original_url" => original_url} = attrs \\ %{}) do
    case get_by_original_url(original_url) do
      nil ->
        %Link{}
        |> Link.changeset(attrs)
        |> Repo.insert()

      %Link{} = link ->
        {:ok, link}
    end
  end
end
