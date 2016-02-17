# nslookup


## Description
**Nslookup** is command-line tool for network administration. Nslookup has two modes: interactive and non-interactive. It is a program to query Internet domain name servers. **Nslookup** means **n**ame **s**erver **lookup**".

 
## Linux
 
### Lockup

TODO: Description

```
nslookup heise.de
```

**Output**
```
nslookup www.heise.de
Server:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
Name:	www.heise.de
Address: 193.99.144.85
```


### Reverse-Lookup
 
TODO: Description

```
nslookup 193.99.144.85
```
**Output**
```
Server:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
85.144.99.193.in-addr.arpa	name = www.heise.de.

Authoritative answers can be found from:
```

### MX-Lookup

TODO: Description

```
nslookup -query=mx goole.de
```

**Output**
```
Server:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
google.de	mail exchanger = 40 alt3.aspmx.l.google.com.
google.de	mail exchanger = 30 alt2.aspmx.l.google.com.
google.de	mail exchanger = 50 alt4.aspmx.l.google.com.
google.de	mail exchanger = 10 aspmx.l.google.com.
google.de	mail exchanger = 20 alt1.aspmx.l.google.com.

Authoritative answers can be found from:
```
### NS-Lookup

TODO: Description

```
nslookup -query=ns heise.de
```

**Output**
```
erver:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
heise.de	nameserver = ns.heise.de.
heise.de	nameserver = ns2.pop-hannover.net.
heise.de	nameserver = ns.s.plusline.de.
heise.de	nameserver = ns.pop-hannover.de.
heise.de	nameserver = ns.plusline.de.

Authoritative answers can be found from:
```

### SOA-Lookup

Start of Authority - Lookup - Description

```
nslookup -query=soa heise.de
```

**Output**
```
Server:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
heise.de
	origin = ns.heise.de
	mail addr = postmaster.ns.heise.de
	serial = 2016020503
	refresh = 10800
	retry = 3600
	expire = 604800
	minimum = 3600
```

### Get all information

TODO: Description

```
nslookup -query=any heise.de
```

**Output**
```
;; Truncated, retrying in TCP mode.
Server:		127.0.1.1
Address:	127.0.1.1#53

Non-authoritative answer:
heise.de	nameserver = ns2.pop-hannover.net.
heise.de	text = "v=spf1 ip4:193.99.144.0/24 ip4:193.99.145.0/24 ip6:2a02:2e0:3fe:1001::/64 ip6:2a00:e68:14:800::/64 include:spf.dynect.net include:_spf.intan.net ?all"
heise.de
	origin = ns.heise.de
	mail addr = postmaster.ns.heise.de
	serial = 2016020503
	refresh = 10800
	retry = 3600
	expire = 604800
	minimum = 3600
heise.de	nameserver = ns.heise.de.
heise.de	nameserver = ns.s.plusline.de.
heise.de	has AAAA address 2a02:2e0:3fe:1001:302::
heise.de	nameserver = ns.pop-hannover.de.
heise.de	mail exchanger = 10 relay.heise.de.
Name:	heise.de
Address: 193.99.144.80
heise.de	nameserver = ns.plusline.de.

Authoritative answers can be found from:
```
