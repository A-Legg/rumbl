defmodule Rumbl.Repo do
  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "Adam", username: "2oops2", password: "password"},
     %Rumbl.User{id: "2", name: "Nick", username: "user2", password: "password123"},
     %Rumbl.User{id: "3", name: "Alex", username: "user3", password: "password456"}]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end 
end
