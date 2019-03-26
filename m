Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3619089D8A
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2019 18:06:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20190326173925.20044-1-michal.winiarski@intel.com>
References: <20190326163256.5315-1-michal.winiarski@intel.com>
 <20190326173925.20044-1-michal.winiarski@intel.com>
Message-ID: <155362354699.7042.13648242267651219640@skylake-alporthouse-com>
Date: Tue, 26 Mar 2019 18:05:47 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/gem_create: Test unaligned BO
 size update
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNaWNoYcWCIFdpbmlhcnNraSAoMjAxOS0wMy0yNiAxNzozOToyNSkKPiBUaGUgZHJp
dmVyIGlzIHN1cHBvc2VkIHRvIHVwZGF0ZSB0aGUgc2l6ZSB3aGVuIGl0J3MgdHJ5aW5nIHRvIG91
dHNtYXJ0Cj4gdXNlcnNwYWNlLiBMZXQncyB0ZXN0IGl0Lgo+IAo+IHYyOiBSZXdvcmsgdG8gdXNl
IGxvY2FsIGlvY3RsIHdyYXBwZXIgKENocmlzKQo+IAo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhxYIg
V2luaWFyc2tpIDxtaWNoYWwud2luaWFyc2tpQGludGVsLmNvbT4KPiBDYzogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gQ2M6IEphbnVzeiBLcnp5c3p0b2ZpayA8amFu
dXN6LmtyenlzenRvZmlrQGludGVsLmNvbT4KPiBDYzogSm9vbmFzIExhaHRpbmVuIDxqb29uYXMu
bGFodGluZW5AbGludXguaW50ZWwuY29tPgo+IC0tLQo+ICtzdGF0aWMgdm9pZCBzaXplX3VwZGF0
ZShpbnQgZmQpCj4gK3sKPiArICAgICAgIGludCBzaXplX2luaXRpYWxfbm9uYWxpZ25lZCA9IDE2
OwoKMTYgaXMgdGhlIHNpemUgb2Ygb25lIHhtbSByZWdpc3Rlci4gSXQgbWlnaHQgYmUgdmFsaWQg
b25lIHllYXIgOykKCkkgd291bGQgcGljayBhICFwb3dlci1vZi10d28gdG8gYmUgc3VyZSBpdCB3
aWxsIG5ldmVyIGJlIGEgdmFsaWQgc2l6ZS4KMTU/Cgo+ICsgICAgICAgc3RydWN0IGRybV9pOTE1
X2dlbV9jcmVhdGUgY3JlYXRlID0gewo+ICsgICAgICAgICAgICAgICAuc2l6ZSA9IHNpemVfaW5p
dGlhbF9ub25hbGlnbmVkLAo+ICsgICAgICAgfTsKPiArCj4gKyAgICAgICBpZ3RfYXNzZXJ0X2Vx
KGNyZWF0ZV9pb2N0bChmZCwgJmNyZWF0ZSksIDApOwo+ICsgICAgICAgaWd0X2Fzc2VydF9uZXEo
Y3JlYXRlLnNpemUsIHNpemVfaW5pdGlhbF9ub25hbGlnbmVkKTsKPiArfQoKQnV0IHllcywgdGhh
dCBzZWVtcyByZWFzb25hYmxlIGF2b2lkYW5jZSBvZiBzYXlpbmcgcHJlY2lzZWx5IHdoYXQKdGhl
IGFsaWdubWVudCBtaWdodCBiZSBzaW5jZSBQQUdFX1NJWkUgaXMgcHVyZSBhY2NpZGVudCwgYWx0
aG91Z2gKY29tbW9ucGxhY2UgdGhyb3VnaG91dCB0aGUgQUJJLgoKPiBAQCAtMjMzLDQgKzI2MCw3
IEBAIGlndF9tYWluCj4gIAo+ICAgICAgICAgaWd0X3N1YnRlc3QoImNyZWF0ZS1jbGVhciIpCj4g
ICAgICAgICAgICAgICAgIGFsd2F5c19jbGVhcihmZCwgMzApOwo+ICsKPiArICAgICAgIGlndF9z
dWJ0ZXN0KCJjcmVhdGUtc2l6ZS11cGRhdGUiKQo+ICsgICAgICAgICAgICAgICBzaXplX3VwZGF0
ZShmZCk7CgpJJ2QgcGxhY2UgaXQgZWFybGllciBzaW5jZSBpdCBpcyBhIGJhc2ljIHRlc3QuIEJ1
dCB3aGF0ZXZlciB3b3Jrcy4KCldpdGggcy8xNi8xNS8KUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2
