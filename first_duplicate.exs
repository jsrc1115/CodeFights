defmodule CodeFights do
  def first_duplicate(a) do
    array_data = array_data(a, 0)
    {min_index, min_value} = Enum.reduce(array_data, {100000000, nil}, fn({_index, data}, {min_index, min_index_value}) ->
        IO.puts(inspect(data))
        indexes = data[:indexes]
        case Enum.fetch(indexes, 1) do
          {:ok, index} -> if min_index > index do {index, data[:value]} else {min_index, min_index_value} end
          :error -> {min_index, min_index_value}
        end
      end
    )
    IO.puts(inspect(min_value))
    if is_nil(min_value) do
      -1
    else
      min_value
    end
  end

  defp array_data([], _index) do
    %{}
  end

  defp array_data([head | tail], index) do
    duplicates_map = array_data(tail, index + 1)

    {count, indexes} = case Map.fetch(duplicates_map, head) do
      {:ok, duplicate} -> {duplicate[:count] + 1, [index | duplicate[:indexes]]}
      :error -> {1, [index]}
    end

    Map.put(duplicates_map, head, %{ :indexes => indexes, :value => head, :count => count })
  end
end

CodeFights.first_duplicate([2, 1, 3, 5, 3, 2])