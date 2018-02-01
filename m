Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 195B46EE74
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 17:20:04 +0000 (UTC)
References: <20180201124746.10641-1-tvrtko.ursulin@linux.intel.com>
 <20180201124746.10641-2-tvrtko.ursulin@linux.intel.com>
 <151748987554.28099.17277033413530501558@mail.alporthouse.com>
 <ead6a608-3cd0-0dda-1095-d27ba4b94a37@linux.intel.com>
 <151750318740.28099.6565723462096485307@mail.alporthouse.com>
 <dd89c8b3-2a01-fad3-54aa-4b229245bf76@linux.intel.com>
 <151750488953.28099.1158358974028674732@mail.alporthouse.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <08743534-d3c5-4644-0c03-cf021394394b@linux.intel.com>
Date: Thu, 1 Feb 2018 17:20:00 +0000
MIME-Version: 1.0
In-Reply-To: <151750488953.28099.1158358974028674732@mail.alporthouse.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/perf_pmu: Tighten busy
 measurement
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Tvrtko Ursulin <tursulin@ursulin.net>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDAxLzAyLzIwMTggMTc6MDgsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFR2cnRr
byBVcnN1bGluICgyMDE4LTAyLTAxIDE2OjU4OjIxKQo+Pgo+PiBJIGFtIGp1c3QgbW92aW5nIHRo
ZSB0d28gc2FtcGxlIHJlYWQtb3V0cyBjbG9zZXIgdG9nZXRoZXIgaW4gdGltZS4gVHdvCj4+IHNh
bXBsZXMgYXJlIG1lYXN1cmUgb2YgaG93IGxvbmcgd2Ugc2xlcHQsIGFuZCBtZWFzdXJlIG9mIFBN
VSBidXN5bmVzcy4KPj4gVGhlcmUgc2hvdWxkIGJlIGFzIGxpdHRsZSB0aW1lIGFzIHBvc3NpYmxl
IGJldHdlZW4gdGhlIHR3byByZWFkb3V0cy4KPj4gRW5kaW5nIHRoZSBzcGlubmVyIEkgZG9uJ3Qg
c2VlIGhvdyBpdCBiZWxvbmdzIGluIHRoaXMgc2FuZHdpY2gsIG9yCj4+IGFueXRoaW5nIGVsc2Ug
cmVhbGx5Lgo+IAo+IFRoZW4gd2UgZGlzYWdyZWUgb24gd2hhdCB3ZSB0aGluayB3ZSBhcmUgbWVh
c3VyaW5nLiBUaGUgdXNsZWVwIHNob3VsZAo+IGVxdWFsIHRoZSBidXN5IHZhbHVlIGRlZmluZWQg
YnkgdGhlIHNwaW4tYmF0Y2guCgpJIGFncmVlLCBhbmQgdGhhdCBpcyB3aHkgdGhlcmUgc2hvdWxk
IGJlIG5vIGV4dHJhIHdvcmsgYmV0d2VlbiB0aGUgc2xlZXAgCmVuZGluZyBhbmQgUE1VIHJlYWQt
b3V0LgoKU2xlZXAgaXMgZGVmaW5pbmcgdGhlIHNwaW4tYmF0Y2ggZHVyYXRpb24gYW5kIHRoYXQg
aXMgdGhlIG1vc3QgYWNjdXJhdGUgCnZhbHVlIGZvciBpdCB3ZSBnb3QuCgpSZWdhcmRzLAoKVHZy
dGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1k
ZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
