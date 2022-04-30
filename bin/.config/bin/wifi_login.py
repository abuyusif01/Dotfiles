#!/bin/env python

from netifaces import ifaddresses, AF_INET
import re
import requests
import uuid
import sys
import argparse


parser = argparse.ArgumentParser(
    prog='wifi_login.py', usage="wifi_login.py [-h] [-H] [-I] [-R] [-i] [-N] [-p] [-c] [-E] [-x] [-r] [-m] [-e] [-g] [-n] [-v] [-A]")
rhost = 'iiumwifilogin2.iium.edu.my'
remote_addr = '10.10.10.10'   # get ur system addr using ip route
url = 'iiumwifilogin2.iium.edu.my'
route = '/guest/guest_register.php?_browser=1'
gsid = ''  # can be anythihg
visitor_name = ''  # ur name
visitor_phone = ''  # ur phone number
visitor_company = ''  # ur company
email = ''  # email
expire_after = '168'  # set how long u wanna use the wifi
role_id = ''  # have no idea wtf is this
mac = ''  # ur mac addr
essid = ''  # have no idea
apgroup = ''  # same shit
apname = ''  # Lmao no idea
vcname = ''  # fucking hell
# am guessing this will update the account after the timeout not sure tho
auto_update_account = ''
creator_accept_terms = ''  # terms and conditions


def set_variables(args):
    for arg in vars(args):
        if arg in ("rhost"):
            global rhost
            if len(rhost) == 0:  # means its empty
                rhost = getattr(args, arg)
        if arg in ("lhost"):
            global remote_addr
            remote_addr = getattr(args, arg)
        if arg in ("rroute"):
            global route
            route = getattr(args, arg)
        if arg in ("gsid"):
            global gsid
            gsid = getattr(args, arg)
        if arg in ("vname"):
            global visitor_name
            visitor_name = getattr(args, arg)
        if arg in ("vphone"):
            global visitor_phone
            visitor_phone = getattr(args, arg)
        if arg in ("vcomp"):
            global visitor_company
            visitor_company = getattr(args, arg)
        if arg in ("email"):
            global email
            email = getattr(args, arg)
        if arg in ("expire"):
            global expire_after
            expire_after = getattr(args, arg)
            expire_after *= 24
        if arg in ("vrole"):
            global role_id
            role_id = getattr(args, arg)
        if arg in ("mac"):
            global mac
            mac = getattr(args, arg)
        if arg in ("essid"):
            global essid
            essid = getattr(args, arg)
        if arg in ("apgroup"):
            global apgroup
            apgroup = getattr(args, arg)
        if arg in ("apname"):
            global apname
            apname = getattr(args, arg)
        if arg in ("vcname"):
            global vcname
            vcname = getattr(args, arg)
        if arg in ("auto_update"):
            global auto_update_account
            auto_update_account = getattr(args, arg)
        if arg in ("terms"):  # really fuck this thing
            global creator_accept_terms
            creator_accept_terms = getattr(args, arg)
            if creator_accept_terms != 1:
                print("Well you must agree with the terms")
                exit()


def get_host_info():
    global mac
    mac = ':'.join(re.findall('..', '%012x' % uuid.getnode()))
    global remote_addr
    remote_addr = ifaddresses('wlp6s0').setdefault(AF_INET)[0]['addr']


def get_cookies():
    global gsid
    url = 'https://iiumwifilogin2.iium.edu.my/guest/guest_register_receipt.php'
    send = requests.get(url)
    gsid = send.request.headers["Cookie"].replace('GSID=', '')


def create_account():
    url_create_account = 'https://iiumwifilogin2.iium.edu.my/guest/guest_register.php?_browser=1'
    url_get_passwd = 'https://iiumwifilogin2.iium.edu.my/guest/guest_register_receipt.php'
    temp_gsid = "GSID=" + gsid
    headers = {'Cookie': temp_gsid}
    data = {'visitor_name': visitor_name, 'visitor_phone': visitor_phone, 'visitor_company': visitor_company,
            'email': email, 'expire_after': expire_after, 'role_id': role_id,
            'remote_addr': remote_addr, 'creator_accept_terms': creator_accept_terms}
    requests.post(url=url_create_account, data=data,
                  headers={"Cookie": temp_gsid})
    upasswd = requests.get(url=url_get_passwd, headers={"Cookie": temp_gsid})
    passwd = re.findall('\"\d{8}\"', upasswd.text)
    return "".join(passwd).replace('"', '')


def login():
    url = 'http://captiveportalmahallahgombak.iium.edu.my/cgi-bin/login'
    data = {'user': email, 'password': create_account(
    ), 'cmd': 'authenticate', 'Login': 'Log In'}
    requests.post(url=url, data=data)


parser.add_argument('-H', '--rhost', metavar='\b',
                    default="iium.edu.my", help='remote host (default: iium.edu.my)')
parser.add_argument('-I', '--lhost', metavar='\b',
                    default="10.10.10.10", help='machine ip address')
parser.add_argument('-i', '--gsid', metavar='\b', help='Guest Cookie')
parser.add_argument('-N', '--vname', metavar='\b', help='username')
parser.add_argument('-p', '--vphone', metavar='\b', help='phone number')
parser.add_argument('-c', '--vcomp', metavar='\b',
                    help='company u wanna register under')
parser.add_argument('-E', '--email', metavar='\b',
                    help='email (default: guest@example.com)')
parser.add_argument('-x', '--expire', metavar='\b',
                    help="expiration time", type=int, default=1)
parser.add_argument('-r', '--vrole', metavar='\b',
                    help="idk wtf this does (default: 2)", type=int, default=2)
parser.add_argument('-t', '--terms', metavar='\b',
                    help="terms and conditions", type=int)
args = parser.parse_args()

if len(sys.argv) == 1:
    parser.print_help()
else:
    set_variables(args)
    get_cookies()
    login()
