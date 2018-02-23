Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09B1D6F1EB
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Feb 2018 16:17:06 +0000 (UTC)
References: <20180221231947.4184-11-antonio.argenziano@intel.com>
 <20180223005438.26761-1-antonio.argenziano@intel.com>
 <151937767192.26255.16441034774256890811@mail.alporthouse.com>
 <151938009582.26255.1852094568625270236@mail.alporthouse.com>
From: Antonio Argenziano <antonio.argenziano@intel.com>
Message-ID: <223448c2-a929-8c0a-3389-abad57296b31@intel.com>
Date: Fri, 23 Feb 2018 08:17:05 -0800
MIME-Version: 1.0
In-Reply-To: <151938009582.26255.1852094568625270236@mail.alporthouse.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v3] igt: Use lib gem_execbuf where
 possible
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

CgpPbiAyMy8wMi8xOCAwMjowMSwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+IFF1b3RpbmcgQ2hyaXMg
V2lsc29uICgyMDE4LTAyLTIzIDA5OjIxOjExKQo+PiBRdW90aW5nIEFudG9uaW8gQXJnZW56aWFu
byAoMjAxOC0wMi0yMyAwMDo1NDozOCkKPj4+IGRpZmYgLS1naXQgYS90ZXN0cy9nZW1fZXhlY19m
ZW5jZS5jIGIvdGVzdHMvZ2VtX2V4ZWNfZmVuY2UuYwo+Pj4gaW5kZXggYjQxNTE5OWYuLjlkOTVj
OTgyIDEwMDY0NAo+Pj4gLS0tIGEvdGVzdHMvZ2VtX2V4ZWNfZmVuY2UuYwo+Pj4gKysrIGIvdGVz
dHMvZ2VtX2V4ZWNfZmVuY2UuYwo+Pj4gQEAgLTU2NSw3ICs1NTMsNyBAQCBzdGF0aWMgdm9pZCB0
ZXN0X2tlZXBfaW5fZmVuY2UoaW50IGZkLCB1bnNpZ25lZCBpbnQgZW5naW5lLCB1bnNpZ25lZCBp
bnQgZmxhZ3MpCj4+PiAgICAgICAgICBsYXN0ID0gLTE7Cj4+PiAgICAgICAgICBjb3VudCA9IDA7
Cj4+PiAgICAgICAgICBkbyB7Cj4+PiAtICAgICAgICAgICAgICAgaW50IGVyciA9IF9fZXhlY2J1
ZihmZCwgJmV4ZWNidWYpOwo+Pj4gKyAgICAgICAgICAgICAgIGludCBlcnIgPSBfX2dlbV9leGVj
YnVmX3dyKGZkLCAmZXhlY2J1Zik7Cj4+Cj4+IERhcm4uIEJ1dCB0aGlzIHN0aWxsIGNhbGxzIGRy
bUlvY3RsKCkgYW5kIHdlIG5lZWQgdGhlIEVJTlRSIGVzY2FwZS4KPiAKPiBEcm9wcGVkIHRoZSBo
dW5rcyB0byBnZW1fZXhlY19mZW5jZSBhbmQgcHVzaGVkLiBUaGFua3MhCgpUaGFua3MgZm9yIHRo
ZSByZXZpZXdzIDopLgoKQW50b25pbwoKPiAtQ2hyaXMKPiAKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
