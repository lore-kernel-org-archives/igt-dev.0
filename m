Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86EF46E15D
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Feb 2018 10:49:35 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180212190158.4710-2-tvrtko.ursulin@linux.intel.com>
References: <20180212190158.4710-1-tvrtko.ursulin@linux.intel.com>
 <20180212190158.4710-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <151851896835.8633.5701490843312100785@mail.alporthouse.com>
Date: Tue, 13 Feb 2018 10:49:28 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] intel-gpu-overlay: Add engine queue
 stats
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
To: Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0xMiAxOTowMTo1NykKPiBkaWZmIC0tZ2l0
IGEvb3ZlcmxheS9vdmVybGF5LmMgYi9vdmVybGF5L292ZXJsYXkuYwo+IGluZGV4IDU0NWFmN2Jj
YjJmNS4uYTYzOTcwM2ViY2VjIDEwMDY0NAo+IC0tLSBhL292ZXJsYXkvb3ZlcmxheS5jCj4gKysr
IGIvb3ZlcmxheS9vdmVybGF5LmMKPiBAQCAtMjU1LDYgKzI1NSwxNSBAQCBzdGF0aWMgdm9pZCBz
aG93X2dwdV90b3Aoc3RydWN0IG92ZXJsYXlfY29udGV4dCAqY3R4LCBzdHJ1Y3Qgb3ZlcmxheV9n
cHVfdG9wICpndAo+ICAgICAgICAgICAgICAgICBsZW4gPSBzcHJpbnRmKHR4dCwgIiVzOiAlM2Ql
JSBidXN5IiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBndC0+Z3B1X3RvcC5yaW5n
W25dLm5hbWUsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ3QtPmdwdV90b3Aucmlu
Z1tuXS51LnUuYnVzeSk7Cj4gKyAgICAgICAgICAgICAgIGlmIChndC0+Z3B1X3RvcC5oYXZlX3F1
ZXVlZCkKPiArICAgICAgICAgICAgICAgICAgICAgICBsZW4gKz0gc3ByaW50Zih0eHQgKyBsZW4s
ICIsIHFkICUuMmYiLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGd0
LT5ncHVfdG9wLnJpbmdbbl0ucXVldWVkKTsKPiArICAgICAgICAgICAgICAgaWYgKGd0LT5ncHVf
dG9wLmhhdmVfcnVubmFibGUpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgbGVuICs9IHNwcmlu
dGYodHh0ICsgbGVuLCAiLCByZCAlLjJmIiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBndC0+Z3B1X3RvcC5yaW5nW25dLnJ1bm5hYmxlKTsKPiArICAgICAgICAgICAg
ICAgaWYgKGd0LT5ncHVfdG9wLmhhdmVfcnVubmluZykKPiArICAgICAgICAgICAgICAgICAgICAg
ICBsZW4gKz0gc3ByaW50Zih0eHQgKyBsZW4sICIsIGVkICUuMmYiLAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGd0LT5ncHVfdG9wLnJpbmdbbl0ucnVubmluZyk7CgpI
bW0sIEkgd291bGQgbGlrZSB0byBjb21wYWN0IHRoaXMgZG93biB0byAiJSUgYnVzeSAoJS4yZiAv
ICUuMmYgLyAlLjJmKSIKd2l0aCBleGVjdXRpb24sIHJ1bm5hYmxlLCBxdWV1ZWQgcmVzcGVjdGl2
ZWx5LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
