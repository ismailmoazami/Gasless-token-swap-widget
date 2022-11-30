from brownie import network, accounts, config


LOCAL_DEVELOPMENT_ENVIROMENTS = ['development', 'mainnet-fork']

def get_account():
    if network.show_active() in LOCAL_DEVELOPMENT_ENVIROMENTS:
        return accounts[0]
    else:
        return accounts.add(config['wallets']['from_key'])   





