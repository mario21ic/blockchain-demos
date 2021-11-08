import requests
import json

from web3 import Web3
from web3.middleware import geth_poa_middleware

web3 = Web3(Web3.HTTPProvider("https://bsc-dataseed.binance.org/"))
web3.middleware_onion.inject(geth_poa_middleware, layer=0)

#https://bscscan.com/tx/0x8e064362eff6f79a12be3650a9a0e58fb298eae60c07318aaaf5ecdcf87f9570
# dAAP ?

if web3.isConnected():
    bsc = web3.eth
    last_block = bsc.getBlock(11786323)

    #print("last_block:", last_block)
    print("last_block.transactions:", len(last_block.transactions))

    first_transaction_id = last_block.transactions[-1] # hex
    print("first_transaction_id:", first_transaction_id)
    
    first_transaction = bsc.getTransaction(first_transaction_id) # hex
    print("first_transaction:",first_transaction)
    # input transaction
    # 0x Id       Address   Amount
    #    8 bytes  64 bytes  64 bytes
    #    99059cbb
    print("first_transaction - input:",first_transaction['input'])

    # https://www.coingecko.com/es/monedas/plant-vs-undead-token/usd
    address = '0x31471e0791fcdbe82fbf4c44943255e923f1b794' # PVU
    token = web3.toChecksumAddress(address)

    # API != ABI
    API_ENDPOINT = "https://api.bscscan.com/api?module=contract&action=getabi&address=" + str(token)
    response = requests.get(API_ENDPOINT)
    #print(response.json())

    with open('pvu.json', 'w') as file:
        abi = response.json()['result']
        json.dump(json.loads(abi), file, indent=4)

    contract = bsc.contract(address=token, abi=abi)
    #print("functions:", contract.functions.__dict__)
    print(contract.functions.name().call())
    print(contract.functions.totalSupply().call()) # total en circulacion



