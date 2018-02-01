Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D0D66EE72
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 17:16:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <151750488953.28099.1158358974028674732@mail.alporthouse.com>
References: <20180201124746.10641-1-tvrtko.ursulin@linux.intel.com>
 <20180201124746.10641-2-tvrtko.ursulin@linux.intel.com>
 <151748987554.28099.17277033413530501558@mail.alporthouse.com>
 <ead6a608-3cd0-0dda-1095-d27ba4b94a37@linux.intel.com>
 <151750318740.28099.6565723462096485307@mail.alporthouse.com>
 <dd89c8b3-2a01-fad3-54aa-4b229245bf76@linux.intel.com>
 <151750488953.28099.1158358974028674732@mail.alporthouse.com>
Message-ID: <151750538824.28099.5491598342169534898@mail.alporthouse.com>
Date: Thu, 01 Feb 2018 17:16:28 +0000
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDItMDEgMTc6MDg6MDkpCj4gUXVvdGluZyBUdnJ0
a28gVXJzdWxpbiAoMjAxOC0wMi0wMSAxNjo1ODoyMSkKPiA+IAo+ID4gSSBhbSBqdXN0IG1vdmlu
ZyB0aGUgdHdvIHNhbXBsZSByZWFkLW91dHMgY2xvc2VyIHRvZ2V0aGVyIGluIHRpbWUuIFR3byAK
PiA+IHNhbXBsZXMgYXJlIG1lYXN1cmUgb2YgaG93IGxvbmcgd2Ugc2xlcHQsIGFuZCBtZWFzdXJl
IG9mIFBNVSBidXN5bmVzcy4gCj4gPiBUaGVyZSBzaG91bGQgYmUgYXMgbGl0dGxlIHRpbWUgYXMg
cG9zc2libGUgYmV0d2VlbiB0aGUgdHdvIHJlYWRvdXRzLiAKPiA+IEVuZGluZyB0aGUgc3Bpbm5l
ciBJIGRvbid0IHNlZSBob3cgaXQgYmVsb25ncyBpbiB0aGlzIHNhbmR3aWNoLCBvciAKPiA+IGFu
eXRoaW5nIGVsc2UgcmVhbGx5Lgo+IAo+IFRoZW4gd2UgZGlzYWdyZWUgb24gd2hhdCB3ZSB0aGlu
ayB3ZSBhcmUgbWVhc3VyaW5nLiBUaGUgdXNsZWVwIHNob3VsZAo+IGVxdWFsIHRoZSBidXN5IHZh
bHVlIGRlZmluZWQgYnkgdGhlIHNwaW4tYmF0Y2guCgpIb3cgYWJvdXQgaWYgaXQgd2FzIHBocmFz
ZWQ6CgoJY3JlYXRlIHNwaW4tYmF0Y2ggcGVyLWVuZ2luZSBxdWV1ZWQgb24gYSB1bnNpZ25hbCB2
Z2VtCglvcGVuX2dyb3VwCgoJc2lnbmFsIHZnZW0gLy8gc3VibWl0IGFsbCBxdWV1ZWQgc3Bpbm5l
cnMgc2ltdWx0YW5lb3VzbHkgKHdlbGwsIHRoYXQncyBvdXIgZ29hbCkKCWR1cmF0aW9uID0gbWVh
c3VyZWRfdXNsZWVwCgllbmQgc3Bpbm5lcnMKCglidXN5ID0gcmVhZF9ncm91cAoKVGhhdCdzIHdo
YXQgSSB3YW50IHRvIG1lYXN1cmUuIFRoZSBwYXNzYWdlIG9mIHRpbWUgb3V0c2lkZSBvZiB0aGUK
c3Bpbm5lciBwaGFzZSBpcyB0aGVuIGlycmVsZXZhbnQsIGFuZCB0aGUgZXJyb3IgaW5zaWRlIGlz
IHNvbWV0aGluZyB0aGF0CndlIGFyZSB0cnlpbmcgdG8gbWluaW1pc2UgYXMgcGFydCBvZiB0aGUg
ZHJpdmVyIG92ZXJoZWFkLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2Cg==
