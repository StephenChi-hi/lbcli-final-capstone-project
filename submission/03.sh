# Which tx in block 216,351 spends the coinbase output of block 216,128?

# the 1st treansaction in any block is the coinbase
COINBASE_TXID=$(bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216128) 2 | jq -r '.tx[0].txid')

# then we look and check which tx has the coinbase txid
bitcoin-cli -signet getblock $(bitcoin-cli -signet getblockhash 216351) 2 | jq -r ".tx[] | select(.vin[].txid == \"$COINBASE_TXID\") | .txid"
