#!/bin/env python

import requests
import argparse
import json

parser = argparse.ArgumentParser(prog='unmineable.py', usage="unmineable.py [-H] [-a] [-c] [-v]")

version = ''
rhost = ''
addr = ''
coin = ''

def set_variable(args):
    for arg in vars(args):
        if arg in ('rhost'):
            global rhost
            rhost = getattr(args, arg)
        if arg in ('version'):
            global version
            version = f'v{getattr(args, arg)}'
        if arg in ('addr'):
            global addr
            addr = getattr(args, arg)
        if arg in ('coin'):
            global coin
            coin = getattr(args, arg)
    rhost = f'{rhost}{version}/address/{addr}?coin={coin}'


def get_balance():
    headers = {'Content-Type': 'application/json'}

    # return an array of total_balance, payable_balance, we use it with get_balance()[0..1]
    try:
        return round(float(json.loads(requests.get(url=rhost,
            headers=headers).text)['data']['balance']), 3), round(float(json.loads(requests.get(url=rhost, headers=headers).text)['data']['balance_payable']), 2)

    # U stupid enough to enter wrong api version
    except json.decoder.JSONDecodeError as err:
        return 'Check you addr, version and try again', err

def main():
    parser.add_argument('-H', '--host', metavar='\b',
            default='https://api.unminable.com/', required=False,
            help='api end point (default: api.unminable.com)')
    parser.add_argument('-a', '--addr', metavar='\b', required=True,
            help='wallet addr')
    parser.add_argument('-c', '--coin', metavar='\b', required=True,
            help='coin type eg. eth, btc, rvn')
    parser.add_argument('-v', '--version', metavar='\b', default='4', required=False,
            help='api version number (default: v4)', type=int)

    args = parser.parse_args()
    set_variable(args)
    print(get_balance()[0])

main()
