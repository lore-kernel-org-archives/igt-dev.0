Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 567C16E24A
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Feb 2018 21:39:33 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180214213424.22393-1-antonio.argenziano@intel.com>
References: <20180214213424.22393-1-antonio.argenziano@intel.com>
Message-ID: <151864436332.15373.16209958507368565612@mail.alporthouse.com>
Date: Wed, 14 Feb 2018 21:39:23 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] igt/gem_exec_fence: Skip parallel*
 tests if I915_PARAM_HAS_EXEC_SUBMIT_FENCE is not defined
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDItMTQgMjE6MzQ6MjQpCj4gSGF2ZSBo
YXNfc3VibWl0X2ZlbmNlIHJldHVybiBmYWxzZSBpZiB0aGUgcGFyYW10ZXIgaXQgaXMgbG9va2lu
ZyBmb3IgaXMKPiBub3QgZGVmaW5lZC4KPiAKPiBCdWd6aWxsYTogaHR0cHM6Ly9idWdzLmZyZWVk
ZXNrdG9wLm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA0Mjg0Cj4gU2lnbmVkLW9mZi1ieTogQW50b25p
byBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgo+IAo+IENjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KPiAtLS0KPiAgdGVzdHMvZ2VtX2V4
ZWNfZmVuY2UuYyB8IDggKysrKysrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvZ2VtX2V4ZWNfZmVuY2Uu
YyBiL3Rlc3RzL2dlbV9leGVjX2ZlbmNlLmMKPiBpbmRleCBiZDdiMTI2My4uNjA0MTBlNzAgMTAw
NjQ0Cj4gLS0tIGEvdGVzdHMvZ2VtX2V4ZWNfZmVuY2UuYwo+ICsrKyBiL3Rlc3RzL2dlbV9leGVj
X2ZlbmNlLmMKPiBAQCAtNjk0LDE3ICs2OTQsMjEgQEAgc3RhdGljIHZvaWQgdGVzdF9mZW5jZV9m
bGlwKGludCBpOTE1KQo+ICAKPiAgc3RhdGljIGJvb2wgaGFzX3N1Ym1pdF9mZW5jZShpbnQgZmQp
Cj4gIHsKCk5vLCB0aGlzIGhhcyB0byBiZSBkZWZpbmVkIGluIHRoaXMgdGVzdCB0byBydW4gYWdh
aW5zdCBrZXJuZWxzIGJlZm9yZSBpdApoaXRzIHRoZSBoZWFkZXJzLiBXaGljaCBpcyB3aHkgd2Ug
dXNlIGxvY2FsIGRlZmluZXMgaW4gdGhlIGZpcnN0IHBsYWNlLgoKPiArI2lmbmRlZiBJOTE1X1BB
UkFNX0hBU19FWEVDX1NVQk1JVF9GRU5DRQo+ICsgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsjZWxz
ZQo+ICAgICAgICAgc3RydWN0IGRybV9pOTE1X2dldHBhcmFtIGdwOwo+ICAgICAgICAgaW50IHZh
bHVlID0gMDsKPiAgCj4gICAgICAgICBtZW1zZXQoJmdwLCAwLCBzaXplb2YoZ3ApKTsKPiAtICAg
ICAgIGdwLnBhcmFtID0gNTA7IC8qIEk5MTVfUEFSQU1fSEFTX0VYRUNfU1VCTUlUX0ZFTkNFICov
Cj4gKyAgICAgICBncC5wYXJhbSA9IEk5MTVfUEFSQU1fSEFTX0VYRUNfU1VCTUlUX0ZFTkNFOwoK
TXkgcGF0Y2hlcyBkaWQgV0lQIF4gSEFTT0VYRUNfU1VCTUlUX0ZFTkNFLgotQ2hyaXMKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
