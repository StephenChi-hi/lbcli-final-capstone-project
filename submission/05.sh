# How many satoshis did this transaction pay for fee?: b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb

TX_ID="b71fb9ab7707407cc7265591e0c0d47d07afede654f91de1f63c0cb522914bcb"

# Get output total (convert BTC to satoshis)
OUT_TOTAL=$(bitcoin-cli -signet getrawtransaction $TX_ID 1 | jq '[.vout[] | .value * 100000000] | add | round')

# Get input total (look up each previous output)
IN_TOTAL=$(bitcoin-cli -signet getrawtransaction $TX_ID 1 | jq -r '.vin[] | "\(.txid) \(.vout)"' | while read TXID VOUT; do
  bitcoin-cli -signet getrawtransaction $TXID 1 | jq ".vout[$VOUT].value * 100000000 | round"
done | jq -s 'add')

# Calculate fee in satoshis
echo "scale=0; $IN_TOTAL - $OUT_TOTAL" | bc
