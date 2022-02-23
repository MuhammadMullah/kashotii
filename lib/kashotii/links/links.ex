defmodule Kashotii.Links do
  @moduledoc """
    Links context
  """
  alias Kashotii.Repo
  alias Kashotii.Links.Link


  def list_links do
    Repo.all(Link)
  end

  @doc """
  Get a single link when given the ID and returns an error tuple if its nil
  """
  @spec get_link({:id, binary}) :: {:error, :not_found} | {:ok, Link.t()}
  def get_link(id) when is_binary(id) do
    case Repo.get!(Link, id) do
      nil -> {:error, :not_found}
      link -> {:ok, link}
    end
  end

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

  @spec create_link(map) :: {:error, atom | Ecto.Changeset.t()} | {:ok, Link.t()}
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

  def change_link(%Link{} = link) do
    Link.changeset(link, %{})
  end
end
