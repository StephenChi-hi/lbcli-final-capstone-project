# Which public key signed input 0 in this tx: d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7

# get transaction details using getrawtransaction with verbose mode (1) the saw it is SegWit tx, so  use jq filter and get pubkey from txinwitness
bitcoin-cli -signet getrawtransaction d948454ceab1ad56982b11cf6f7157b91d3c6c5640e05c041cd17db6fff698f7 1 | jq -r '.vin[0].txinwitness[-1]'
