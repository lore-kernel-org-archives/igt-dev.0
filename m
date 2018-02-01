Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9396E0DB
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 12:58:07 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180201124746.10641-2-tvrtko.ursulin@linux.intel.com>
References: <20180201124746.10641-1-tvrtko.ursulin@linux.intel.com>
 <20180201124746.10641-2-tvrtko.ursulin@linux.intel.com>
Message-ID: <151748987554.28099.17277033413530501558@mail.alporthouse.com>
Date: Thu, 01 Feb 2018 12:57:55 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/perf_pmu: Tighten busy
 measurement
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

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOC0wMi0wMSAxMjo0Nzo0NCkKPiBGcm9tOiBUdnJ0
a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IAo+IEluIGNhc2VzIHdoZXJl
IHdlIG1hbnVhbGx5IHRlcm1pbmF0ZSB0aGUgYnVzeSBiYXRjaCwgd2UgYWx3YXlzIHdhbnQgdG8K
PiBzYW1wbGUgYnVzeW5lc3Mgd2hpbGUgdGhlIGJhdGNoIGlzIHJ1bm5pbmcsIGp1c3QgYmVmb3Jl
IHdlIHdpbGwKPiB0ZXJtaW5hdGUgaXQsIGFuZCBub3QgdGhlIG90aGVyIHdheSBhcm91bmQuIFRo
aXMgd2F5IHdlIG1ha2UgdGhlIHdpbmRvdwo+IGZvciB1bndhdGVkIGlkbGVuZXNzIGdldHRpbmcg
c2FtcGxlZCBzbWFsbGVyLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0
a28udXJzdWxpbkBpbnRlbC5jb20+Cj4gLS0tCj4gIHRlc3RzL3BlcmZfcG11LmMgfCAyOCArKysr
KysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25z
KCspLCAxNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBi
L3Rlc3RzL3BlcmZfcG11LmMKPiBpbmRleCAyZjdkMzM0MTRhNTMuLmJmMTZlNWU4YjFmOSAxMDA2
NDQKPiAtLS0gYS90ZXN0cy9wZXJmX3BtdS5jCj4gKysrIGIvdGVzdHMvcGVyZl9wbXUuYwo+IEBA
IC0xNDYsMTAgKzE0Niw5IEBAIHNpbmdsZShpbnQgZ2VtX2ZkLCBjb25zdCBzdHJ1Y3QgaW50ZWxf
ZXhlY3V0aW9uX2VuZ2luZTIgKmUsIGJvb2wgYnVzeSkKPiAgICAgICAgICAgICAgICAgc3BpbiA9
IE5VTEw7Cj4gIAo+ICAgICAgICAgc2xlcHQgPSBtZWFzdXJlZF91c2xlZXAoYmF0Y2hfZHVyYXRp
b25fbnMgLyAxMDAwKTsKPiAtICAgICAgIGlndF9zcGluX2JhdGNoX2VuZChzcGluKTsKPiAtCj4g
ICAgICAgICB2YWwgPSBwbXVfcmVhZF9zaW5nbGUoZmQpOwo+ICAKPiArICAgICAgIGlndF9zcGlu
X2JhdGNoX2VuZChzcGluKTsKCkJ1dCB0aGF0J3MgdGhlIHdyb25nIHdheSByb3VuZCBhcyB3ZSBh
cmUgbWVhc3VyaW5nIGJ1c3luZXNzLCBhbmQgdGhlCnNhbXBsaW5nIHNob3VsZCB0ZXJtaW5hdGUg
YXMgc29vbiBhcyB0aGUgc3Bpbi1iYXRjaCBlbmRzLCBiZWZvcmUgd2UgZXZlbgpyZWFkIHRoZSBQ
TVUgc2FtcGxlPyBGb3IgdGhlIHRpbWVyIHNhbXBsZXIsIGl0J3MgbG9zdCBpbiB0aGUgbm9pc2Uu
CgpTbyB0aGUgaWRlYSB3YXMgdG8gY2FuY2VsIHRoZSBidXN5bmVzcyBhc2FwIHNvIHRoYXQgdGhl
IHNhbXBsZXIgc3RvcHMKdXBkYXRpbmcgYmVmb3JlIHdlIGV2ZW4gaGF2ZSB0byBjcm9zcyBpbnRv
IHRoZSBrZXJuZWwgZm9yIHRoZSBQTVUgcmVhZC4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
