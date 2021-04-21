defmodule Inmana.Welcomer do
  # Receber um nome e uma idade do usuário
  # Se o usuário chamar "banana" e tiver idade "42", ele recebe uma mensagem especial
  # Se o usuário for menos de idade, retornamos um erro
  # Temos que tratar o nome do usuário para entradas erradas.any()

  def welcome(%{"name" => name, "age" => age}) do
    age = String.to_integer(age)

    name
    |> String.trim()
    |> String.downcase()
    |> evaluate(age)
  end

  defp evaluate("banana", 42) do
    {:ok, "You are very special, banana"}
  end

  defp evaluate(name, age) when age >= 18 do
    {:ok, "Welcome #{name}"}
  end

  defp evaluate(name, _age) do
    {:error, "You shall no pass, #{name}"}
  end
end
