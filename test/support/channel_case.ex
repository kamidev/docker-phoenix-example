defmodule HelloWeb.ChannelCase do
  @moduledoc """
  This module defines the test case to be used by
  channel tests.

  Such tests rely on `Phoenix.ChannelTest` and also
  import other functionality to make it easier
  to build common data structures and query the data layer.

  Finally, if the test case interacts with the database,
  we enable the SQL sandbox, so changes done to the database
  are reverted at the end of every test. If you are using
  PostgreSQL, you can even run database tests asynchronously
  by setting `use HelloWeb.ChannelCase, async: true`, although
  this option is not recommended for other databases.
  """

  use ExUnit.CaseTemplate

  using do
    quote do
      import Phoenix.ChannelTest
      import HelloWeb.ChannelCase

      @endpoint HelloWeb.Endpoint
    end
  end

  setup tags do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(Hello.Repo)

    unless tags[:async] do
      Ecto.Adapters.SQL.Sandbox.mode(Hello.Repo, {:shared, self()})
    end

    :ok

    # maybe use this
    # pid = Ecto.Adapters.SQL.Sandbox.start_owner!(Hello.Repo, shared: not tags[:async])
    # on_exit(fn -> Ecto.Adapters.SQL.Sandbox.stop_owner(pid) end)

    # :ok
  end
end
