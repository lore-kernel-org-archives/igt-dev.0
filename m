Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCDE26E293
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Feb 2018 08:10:56 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180208080131.3004-2-tvrtko.ursulin@linux.intel.com>
References: <20180208080131.3004-1-tvrtko.ursulin@linux.intel.com>
 <20180208080131.3004-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <151807744819.28809.12247829425156020313@mail.alporthouse.com>
Date: Thu, 08 Feb 2018 08:10:48 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] tests/perf_pmu: Handle thermally
 throttled devices
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wOCAwODowMTozMCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IFNvbWUgc3lzdGVtcyBj
YW5ub3QgcmVhY2ggdGhlIGFkdmVydGlzZWQgbWF4aW11bSBmcmVxdWVuY3kgZHVlIHRocm90dGxp
bmcuCj4gSGFuZGxlIHRoZW0gYnkgY29uc2lkZXJpbmcgYSAxMDBNSHogbG93ZXIgbGltaXQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNv
bT4KPiAtLS0KPiAgdGVzdHMvcGVyZl9wbXUuYyB8IDcgKysrKysrLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L3BlcmZfcG11LmMgYi90ZXN0cy9wZXJmX3BtdS5jCj4gaW5kZXggNzBmYjZiZDU1ZTUzLi4wN2Iy
NTc2NWYxZjYgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvcGVyZl9wbXUuYwo+ICsrKyBiL3Rlc3RzL3Bl
cmZfcG11LmMKPiBAQCAtMTIyMiw4ICsxMjIyLDEzIEBAIHRlc3RfZnJlcXVlbmN5KGludCBnZW1f
ZmQpCj4gICAgICAgICAgICAgICAgICBtaW5bMF0sIG1pblsxXSk7Cj4gICAgICAgICBpZ3RfaW5m
bygiTWF4IGZyZXF1ZW5jeTogcmVxdWVzdGVkICUuMWYsIGFjdHVhbCAlLjFmXG4iLAo+ICAgICAg
ICAgICAgICAgICAgbWF4WzBdLCBtYXhbMV0pOwo+ICsKPiAgICAgICAgIGFzc2VydF93aXRoaW5f
ZXBzaWxvbihtaW5bMF0sIG1pbl9mcmVxLCB0b2xlcmFuY2UpOwo+IC0gICAgICAgYXNzZXJ0X3dp
dGhpbl9lcHNpbG9uKG1heFswXSwgbWF4X2ZyZXEsIHRvbGVyYW5jZSk7Cj4gKyAgICAgICAvKgo+
ICsgICAgICAgICogT24gdGhlcm1hbGx5IHRocm90dGxlZCBkZXZpY2VzIHdlIGNhbm5vdCBiZSBz
dXJlIG1heGltdW0gZnJlcXVlbmN5Cj4gKyAgICAgICAgKiBjYW4gYmUgcmVhY2hlZCBzbyB1c2Ug
YSBsb3dlciBsaW1pdC4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWd0X2Fzc2VydChtYXhbMF0g
Pj0gKChkb3VibGUpbWF4X2ZyZXEgLSAxMDAuMCkpOwoKV2Ugc3RpbGwgd2FudCBhIDItc2lkZWQg
Y2hlY2sgdGhvdWdoLiBXZSBzaG91bGRuJ3QgYmUgcmVwb3J0aW5nIG1heCA+Cm1heF9mcmVxIChi
ZXlvbmQgcmVhc29uYWJsZSBjYWxjdWxhdGlvbiBlcnJvcnMpLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
