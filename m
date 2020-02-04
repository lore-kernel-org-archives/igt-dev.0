Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7957F6E584
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Feb 2020 08:42:00 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
References: <20200204072122.5968-1-zbigniew.kempczynski@intel.com>
Message-ID: <158080569744.27392.14619919263736144841@skylake-alporthouse-com>
Date: Tue, 04 Feb 2020 08:41:37 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_set_tiling_vs_pwrite:
 disable test on gens without ggtt
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDItMDQgMDc6MjE6MjIpCj4gVGVz
dCByZXF1aXJlcyBmZW5jZXMgdG8gbWFwIHZpYSBnZ3R0IHNvIHdlIGNhbiBza2lwIGl0IG9uIG5l
d2VyIGdlbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymln
bmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+Cj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgo+IC0tLQo+ICB0ZXN0cy9pOTE1L2dlbV9zZXRfdGlsaW5nX3ZzX3B3
cml0ZS5jIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+IAo+IGRpZmYg
LS1naXQgYS90ZXN0cy9pOTE1L2dlbV9zZXRfdGlsaW5nX3ZzX3B3cml0ZS5jIGIvdGVzdHMvaTkx
NS9nZW1fc2V0X3RpbGluZ192c19wd3JpdGUuYwo+IGluZGV4IDI1YTI4MTkxLi5iMzdhMmVlNCAx
MDA2NDQKPiAtLS0gYS90ZXN0cy9pOTE1L2dlbV9zZXRfdGlsaW5nX3ZzX3B3cml0ZS5jCj4gKysr
IGIvdGVzdHMvaTkxNS9nZW1fc2V0X3RpbGluZ192c19wd3JpdGUuYwo+IEBAIC01NSw2ICs1NSw3
IEBAIGlndF9zaW1wbGVfbWFpbgo+ICAgICAgICAgdWludDMyX3QgaGFuZGxlOwo+ICAKPiAgICAg
ICAgIGZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7Cj4gKyAgICAgICBnZW1fcmVx
dWlyZV9tYXBwYWJsZV9nZ3R0KGZkKTsKCkl0IGRvZXNuJ3QgcmVxdWlyZSB0aGUgZ3R0IHBlciBz
ZS4gSXQncyB1c2Ugb2YgdGhlIGd0dCBpcyBoaWdobHkKcXVlc3Rpb25hYmxlIGFuZCBkb2Vzbid0
IHF1aXRlIGRvIHdoYXQgaXQgb25jZSBkaWQgYW55d2F5LgotQ2hyaXMKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
