defmodule Cards do

  @moduledoc """
  Provides methods for creating and handling a deck of cards
  """

  @doc """
  Returns a list of strings representing a deck of playing cards
  """
  def create_deck do
    values = ["4", "5", "6", "7", "Q", "J", "K", "A", "2", "3"]
    suits = ["♢", "♠", "♡", "♣"]

      for  value <- values, suit <- suits do
        "#{value} de #{suit}"
      end

    # cards = for value <- values do
    #   for suit <- suits do
    #     "#{value} de #{suit}"
    #   end
    # end

    # List.flatten(cards)

  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end


  @doc """
  Divides a deck into a hand and the remainder of the deck.
  The `hand_size` argument indicates how many cards should be in de hand.

  ## Examples

      iex> deck = Cards.create_deck
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]

  """

  def deal(deck, hand_size) do
    Enum.split(deck,hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    #{status, binary} = File.read(filename)
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term binary
      {:error, _reason} -> "Arquivo não existe"
    end
  end

  # def create_hand do
  #   deck = Cards.create_deck
  #   deck = Cards.shuffle(deck)
  #   hand = Cards.deal(deck, hand_size)
  # end

  # Usando pipe operator |> esta função abaixo substitui a de cima.
  # A variavel deck e passada automaticamente para shuffle e para
  # o primeiro parametro do deal
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end



end