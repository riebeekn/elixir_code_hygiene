defmodule CodeHygieneWeb.PageController do
  @moduledoc false
  use CodeHygieneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
