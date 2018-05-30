defmodule EventsWeb.EventView do
  use EventsWeb, :view
  alias EventsWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{
      id: event.id,
      title: event.title,
      allDay: event.allDay,
      start: event.start |> DateTime.to_iso8601(),
      end: event.end |> DateTime.to_iso8601(),
      color: event.color
    }
  end
end
