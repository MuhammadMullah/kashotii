defmodule Kashotii.Links.LinkTest do
  @moduledoc false
  use Kashotii.DataCase

  alias Kashotii.Links.Link

  @valid_attrs %{original_url: "someurl", identifier: "someidentifier"}
  @invalid_attrs %{original_url: "", identifier: ""}

  describe "link changesets" do
    test " valid with correct attributes" do
      changeset = Link.changeset(%Link{}, @valid_attrs)
      assert changeset.valid?
    end

    test "invalid with wrong attributes" do
      changeset = Link.changeset(%Link{}, @invalid_attrs)
      refute changeset.valid?
    end
  end
end
