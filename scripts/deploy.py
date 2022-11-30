from brownie import GasSwap 
from scripts.helper_functions import get_account

def deploy():
    account = get_account()

    gas_swap = GasSwap.deploy("0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D", {'from': account})
    

def main():
    deploy()