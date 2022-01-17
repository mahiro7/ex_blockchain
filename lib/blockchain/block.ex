defmodule ExBlockchain.Blockchain.Block do
  @moduledoc """
    Module where contains every block related function and logic.
    
    This is a single block struct in a blockchain.
  """

  alias __MODULE__

  @type t :: %Block{
    timestamp: pos_integer(),
    last_hash: String.t(),
    hash: String.t(),
    data: any()
  }

  defstruct ~w/timestamp last_hash hash data/a

  @spec new(pos_integer(), String.t(), any()) :: Block.t()
  def new(timestamp, last_hash, data) do
    hash = hash(timestamp, last_hash, data)
    %__MODULE__{
      timestamp: timestamp, 
      last_hash: last_hash, 
      hash: hash,
      data: data
    }
  end

  @spec genesis() :: Block.t()
  def genesis() do
    __MODULE__.new(1_599_909_623_805_627, "-", "genesis data")
  end

  def mine_block(%__MODULE__{hash: last_hash}, data) do
    __MODULE__.new(get_timestamp(), last_hash, data)
  end

  defp get_timestamp(), do: DateTime.utc_now() |> DateTime.to_unix(1_000_000)

  defp hash(timestamp, last_hash, data) do
    data = "#{timestamp}:#{last_hash}:#{Jason.encode! data}"
    Base.encode16(:crypto.hash(:sha256, data))
  end
end
