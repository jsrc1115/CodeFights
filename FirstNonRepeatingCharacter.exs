defmodule CodeFights do
  def first_non_repeating_character(s) do
    s_charlist = String.codepoints(s)

    array_data = array_data(s_charlist, 0)

    {min_index, min_value} = Enum.reduce(array_data, {100000000, nil}, fn({_index, data}, {min_index, min_index_value}) ->
      indexes = data[:indexes]
      indexes_count = Enum.count(indexes)
      if indexes_count == 1 do
        current_index = List.first(indexes)
        if current_index < min_index do
          {current_index, data[:value]}
        else
          {min_index, min_index_value}
        end
      else
        {min_index, min_index_value}
      end
    end
    )
    min_value
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

CodeFights.first_non_repeating_character("abacabad")