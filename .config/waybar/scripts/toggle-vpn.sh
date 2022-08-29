#!/bin/bash

if [[ $(ip a | grep abivin) ]]; then
    wg-quick down abivin
else
    wg-quick up abivin
fi

