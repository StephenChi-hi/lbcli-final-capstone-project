# How many new outputs were created by block 243,825?

# will need to inspect the block using getblock with verbosity 2 to get full tx details then use jq to filter and count the outputs  
bitcoin-cli -signet  getblock $(  bitcoin-cli -signet getblockhash 243825 ) 2 | jq '[.tx[] | .vout | length] | add'
