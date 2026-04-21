# what block height was this tx mined ?
# 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb

# get tx details then jq for the block hash and use the hash to get block details
bitcoin-cli -signet getblock $(bitcoin-cli -signet getrawtransaction 49990a9c8e60c8cba979ece134124695ffb270a98ba39c9824e42c4dc227c7eb 1 | jq -r .blockhash) 1 | jq -r .height

