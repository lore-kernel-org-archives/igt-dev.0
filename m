Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8B66E2D6
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Feb 2018 14:38:01 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180205113810.15045-1-tvrtko.ursulin@linux.intel.com>
References: <151760778327.15322.10262825883779352598@mail.alporthouse.com>
 <20180205113810.15045-1-tvrtko.ursulin@linux.intel.com>
Message-ID: <151784146513.15322.10997692758468752374@mail.alporthouse.com>
Date: Mon, 05 Feb 2018 14:37:45 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v2 9/9] tests/perf_pmu: Use short
 batches from hotplug test
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wNSAxMTozODoxMCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFRoaXMgdGVzdCBlbWl0
cyBhIHNwaW4gYmF0Y2ggd2hpY2ggcnVucyByb3VnaGx5IGZvciBOIENQVSBjb3JlcyBzZWNvbmRz
Cj4gQXMgc3VjaCB0aGVzZSBjYW4gYmUgZGVjbGFyZWQgYXMgR1BVIGhhbmdzLCBzbyB3b3JrIGFy
b3VuZCB0aGF0IGJ5IGxvb3BpbmcKPiB3aXRoIHNob3J0ZXIgYmF0Y2hlcy4KPiAKPiB2MjoKPiAg
KiBVc2Ugb3ZlcmxhcHBpbmcgc3Bpbm5lcnMuIChDaHJpcyBXaWxzb24pCj4gICogR28gYmFjayB0
byBpZ3RfZm9yay4gKENocmlzIFdpbHNvbikKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUdnJ0a28gVXJz
dWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IC0tLQo+ICsgICAgICAgLyoKPiArICAg
ICAgICAqIFZlcnkgbG9uZyBiYXRjaGVzIGNhbiBiZSBkZWNsYXJlZCBhcyBHUFUgaGFuZ3Mgc28g
ZW1pdCBzaG9ydGVyIG9uZXMKPiArICAgICAgICAqIHVudGlsIHRoZSBDUFUgY29yZSBzaHVmZmxl
ciBmaW5pc2hlcyBvbmUgbG9vcC4KPiArICAgICAgICAqLwo+ICsgICAgICAgZm9yICg7Oykgewo+
ICsgICAgICAgICAgICAgICBjaGFyIGJ1ZjsKPiArICAgICAgICAgICAgICAgaW50IHJldDI7CgpJ
IGRpZG4ndCBtZWFuIGEgbmV3ICJpbnQgcmV0OyIgaGVyZSwganVzdCByZXVzZSB0aGUgb3V0ZXIg
cmV0IDopCgo+ICAKPiAtICAgICAgIGlndF9zcGluX2JhdGNoX2VuZChzcGluKTsKPiAtICAgICAg
IGdlbV9zeW5jKGdlbV9mZCwgc3Bpbi0+aGFuZGxlKTsKPiAtICAgICAgIGlndF9zcGluX2JhdGNo
X2ZyZWUoZ2VtX2ZkLCBzcGluKTsKPiArICAgICAgICAgICAgICAgdXNsZWVwKDUwMGUzKTsKPiAr
ICAgICAgICAgICAgICAgZW5kX3NwaW4oZ2VtX2ZkLCBzcGluW2N1cl0sIDApOwo+ICsKPiArICAg
ICAgICAgICAgICAgLyogQ2hlY2sgaWYgdGhlIGNoaWxkIGlzIHNpZ25hbGluZyBjb21wbGV0aW9u
LiAqLwo+ICsgICAgICAgICAgICAgICByZXQyID0gcmVhZChsaW5rWzBdLCAmYnVmLCAxKTsKPiAr
ICAgICAgICAgICAgICAgaWYgKCByZXQyID09IDEgfHwgKHJldDIgPCAwICYmIGVycm5vICE9IEVB
R0FJTikpCiAgICAgICAgICAgICAgICAgICAgICBeIHNwYXJlIHNwYWNlLgoKUmV2aWV3ZWQtYnk6
IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotQ2hyaXMKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
