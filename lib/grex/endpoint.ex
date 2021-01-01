defmodule Grex.Endpoint do
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug Plug.Parsers,
    parsers: [],
    json_decoder: Jason
  plug :dispatch

  get "/_matrix/client/versions" do
    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200,
      Jason.encode!(
	%{versions: [
	     "r0.6.0"
	   ]
	}
      )
    )
  end
  
  match _ do
    send_resp(conn, 404, "oops... Nothing here :(")
  end

end