# what is the coinbase tx in this block 243,834

# get block data and then extract 1st transaction txid
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 243834) 2 | jq -r '.tx[0].txid'
