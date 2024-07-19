defmodule RomanNumeral do
  @numerals [
    {1000, "M"},
    {900, "CM"},
    {500, "D"},
    {400, "CD"},
    {100, "C"},
    {90, "XC"},
    {50, "L"},
    {40, "XL"},
    {10, "X"},
    {9, "IX"},
    {5, "V"},
    {4, "IV"},
    {1, "I"}
  ]

  def convert(number) do
    number
    |> validate()
    |> convert(@numerals)
  end

  defp validate(number) when number < 1 or number > 3999, do: {:error, "Número inválido"}
  defp validate(number), do: {:ok, number}

  defp convert({:error, _}, _), do: ""

  defp convert({:ok, number}, numerals) do
    convert(number, numerals, "")
  end

  defp convert(0, _numerals, acc), do: acc

  defp convert(number, [{arabic, roman} | tail], acc) when number >= arabic do
    convert(number - arabic, [{arabic, roman} | tail], acc <> roman)
  end

  defp convert(number, [_ | tail], acc) do
    convert(number, tail, acc)
  end
end

defmodule Cumbuquia do
  def run(input_fn \\ fn -> IO.gets("") end) do
    IO.puts "Digite os nomes dos reis e rainhas de Cumbúquia para cada linha. Pressione Enter em uma linha vazia para finalizar:"

    names = read_input([], input_fn)
    names
    |> format_names()
    |> Enum.each(&IO.puts/1)
  end

  def read_input(acc, input_fn) do
    case input_fn.() do
      "\n" -> Enum.reverse(acc)
      line -> read_input([String.trim(line) | acc], input_fn)
    end
  end

  def format_names(names) do
    names
    |> Enum.reduce({[], %{}}, fn name, {result, acc} ->
      count = Map.get(acc, name, 0) + 1
      formatted_name = "#{name} #{RomanNumeral.convert(count)}"
      updated_acc = Map.put(acc, name, count)
      {result ++ [formatted_name], updated_acc}
    end)
    |> elem(0)
  end
end

Cumbuquia.run()
