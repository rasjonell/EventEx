defmodule EventsWeb.Router do
  use EventsWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", EventsWeb do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/submit", PageController, :submit
  end

  scope "/api", EventsWeb do
    pipe_through :api
    
    resources "/events", EventController, except: [:new, :edit]
  end
end
