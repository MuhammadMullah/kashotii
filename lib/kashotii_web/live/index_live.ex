defmodule KashotiiWeb.IndexLive do
  use KashotiiWeb, :live_view

  alias Kashotii.Links
  alias Kashotii.Links.Link
  alias KashotiiWeb.Endpoint

  def mount(_params, _session, socket) do
    urls = Links.list_links
    changeset = Links.change_link(%Link{})
    socket =
      socket
      |> assign(:urls, urls)
      |> assign(:changeset, changeset)

    {:ok, socket}
  end

  def handle_event("validate", %{"link" => params}, socket) do
    changeset =
      %Link{}
      |> Links.change_link()
      |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  def handle_event("save", %{"link" => params}, socket) do
    case Links.create_link(params) do
      {:ok, %Link{identifier: identifier}} ->
        {:noreply,
         socket
         |> put_flash(:info, "#{Endpoint.url()}/#{identifier}")}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
