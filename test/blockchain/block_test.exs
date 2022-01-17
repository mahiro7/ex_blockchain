defmodule ExBlockchain.Blockchain.BlockTest do
  use ExUnit.Case
  alias ExBlockchain.Blockchain.Block

  describe "block" do
    test "genesis is valid" do
      assert %Block{
        data: "genesis data",
        hash: "F277BF9150CD035D55BA5B48CB5BCBE8E564B134E5AD0D56E439DD04A1528D3B",
        last_hash: "-",
        timestamp: 1_599_909_623_805_627
      } == Block.genesis()
    end
  end

  test "should give a new block when we pass the parameters" do
    timestamp = DateTime.utc_now() |> DateTime.to_unix(1_000_000)
    data = "this is new block data"
    last_hash = "random_hash"

    assert %Block{timestamp: ^timestamp, hash: _hash, last_hash: ^last_hash, data: ^data} =
      Block.new(timestamp, last_hash, data)
  end
end
