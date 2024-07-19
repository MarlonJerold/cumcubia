defmodule RomanNumeralTest do
  use ExUnit.Case

  alias RomanNumeral

  test "Converter número inteiros para numerais romanos" do
    assert RomanNumeral.convert(1) == "I"
    assert RomanNumeral.convert(2) == "II"
    assert RomanNumeral.convert(4) == "IV"
    assert RomanNumeral.convert(5) == "V"
    assert RomanNumeral.convert(9) == "IX"
    assert RomanNumeral.convert(10) == "X"
    assert RomanNumeral.convert(40) == "XL"
    assert RomanNumeral.convert(50) == "L"
    assert RomanNumeral.convert(99) == "XCIX"
    assert RomanNumeral.convert(100) == "C"
    assert RomanNumeral.convert(3999) == "MMMCMXCIX"
  end

  test "converte 0 para uma string vazia" do
    assert RomanNumeral.convert(0) == ""
  end

  test "lida com números inválidos (números negativos)" do
    assert RomanNumeral.convert(-1) == ""
  end

  test "lida com números inválidos (números maiores que 3999)" do
    assert RomanNumeral.convert(4000) == ""
  end
end

defmodule CumbuquiaTest do
  use ExUnit.Case

  test "format_names/1 formata nomes corretamente" do
    input_names = ["Eduardo", "Maria", "Daniel", "Eduardo", "Maria", "Eduardo"]

    expected_output = [
      "Eduardo I",
      "Maria I",
      "Daniel I",
      "Eduardo II",
      "Maria II",
      "Eduardo III"
    ]

    assert Cumbuquia.format_names(input_names) == expected_output
  end
end
