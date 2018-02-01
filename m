Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D0D6EE7F
 for <igt-dev@lists.freedesktop.org>; Thu,  1 Feb 2018 17:34:27 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <151750538824.28099.5491598342169534898@mail.alporthouse.com>
References: <20180201124746.10641-1-tvrtko.ursulin@linux.intel.com>
 <20180201124746.10641-2-tvrtko.ursulin@linux.intel.com>
 <151748987554.28099.17277033413530501558@mail.alporthouse.com>
 <ead6a608-3cd0-0dda-1095-d27ba4b94a37@linux.intel.com>
 <151750318740.28099.6565723462096485307@mail.alporthouse.com>
 <dd89c8b3-2a01-fad3-54aa-4b229245bf76@linux.intel.com>
 <151750488953.28099.1158358974028674732@mail.alporthouse.com>
 <151750538824.28099.5491598342169534898@mail.alporthouse.com>
Message-ID: <151750645864.28099.7741526230218562800@mail.alporthouse.com>
Date: Thu, 01 Feb 2018 17:34:18 +0000
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

UXVvdGluZyBDaHJpcyBXaWxzb24gKDIwMTgtMDItMDEgMTc6MTY6MjgpCj4gUXVvdGluZyBDaHJp
cyBXaWxzb24gKDIwMTgtMDItMDEgMTc6MDg6MDkpCj4gPiBRdW90aW5nIFR2cnRrbyBVcnN1bGlu
ICgyMDE4LTAyLTAxIDE2OjU4OjIxKQo+ID4gPiAKPiA+ID4gSSBhbSBqdXN0IG1vdmluZyB0aGUg
dHdvIHNhbXBsZSByZWFkLW91dHMgY2xvc2VyIHRvZ2V0aGVyIGluIHRpbWUuIFR3byAKPiA+ID4g
c2FtcGxlcyBhcmUgbWVhc3VyZSBvZiBob3cgbG9uZyB3ZSBzbGVwdCwgYW5kIG1lYXN1cmUgb2Yg
UE1VIGJ1c3luZXNzLiAKPiA+ID4gVGhlcmUgc2hvdWxkIGJlIGFzIGxpdHRsZSB0aW1lIGFzIHBv
c3NpYmxlIGJldHdlZW4gdGhlIHR3byByZWFkb3V0cy4gCj4gPiA+IEVuZGluZyB0aGUgc3Bpbm5l
ciBJIGRvbid0IHNlZSBob3cgaXQgYmVsb25ncyBpbiB0aGlzIHNhbmR3aWNoLCBvciAKPiA+ID4g
YW55dGhpbmcgZWxzZSByZWFsbHkuCj4gPiAKPiA+IFRoZW4gd2UgZGlzYWdyZWUgb24gd2hhdCB3
ZSB0aGluayB3ZSBhcmUgbWVhc3VyaW5nLiBUaGUgdXNsZWVwIHNob3VsZAo+ID4gZXF1YWwgdGhl
IGJ1c3kgdmFsdWUgZGVmaW5lZCBieSB0aGUgc3Bpbi1iYXRjaC4KPiAKPiBIb3cgYWJvdXQgaWYg
aXQgd2FzIHBocmFzZWQ6Cj4gCj4gICAgICAgICBjcmVhdGUgc3Bpbi1iYXRjaCBwZXItZW5naW5l
IHF1ZXVlZCBvbiBhIHVuc2lnbmFsIHZnZW0KPiAgICAgICAgIG9wZW5fZ3JvdXAKPiAKPiAgICAg
ICAgIHNpZ25hbCB2Z2VtIC8vIHN1Ym1pdCBhbGwgcXVldWVkIHNwaW5uZXJzIHNpbXVsdGFuZW91
c2x5ICh3ZWxsLCB0aGF0J3Mgb3VyIGdvYWwpCj4gICAgICAgICBkdXJhdGlvbiA9IG1lYXN1cmVk
X3VzbGVlcAo+ICAgICAgICAgZW5kIHNwaW5uZXJzCj4gCj4gICAgICAgICBidXN5ID0gcmVhZF9n
cm91cAo+IAo+IFRoYXQncyB3aGF0IEkgd2FudCB0byBtZWFzdXJlLiBUaGUgcGFzc2FnZSBvZiB0
aW1lIG91dHNpZGUgb2YgdGhlCj4gc3Bpbm5lciBwaGFzZSBpcyB0aGVuIGlycmVsZXZhbnQsIGFu
ZCB0aGUgZXJyb3IgaW5zaWRlIGlzIHNvbWV0aGluZyB0aGF0Cj4gd2UgYXJlIHRyeWluZyB0byBt
aW5pbWlzZSBhcyBwYXJ0IG9mIHRoZSBkcml2ZXIgb3ZlcmhlYWQuCgpPaywgc28gd2UgYXJlIGxv
b2tpbmcgYXQgc2xpZ2h0bHkgZGlmZmVyZW50IGFuZ2xlcyBoZXJlLiBUaGUgcGF0Y2gKYXBwbGll
cyB5b3VyIGlkZWEgb2YgZXhjbHVkaW5nIHRoZSB2YWdhcmllcyBpbiBjb250cm9sbGluZyB0aGUg
c3Bpbm5pbmcKYmF0Y2ggZnJvbSBtZWFzdXJpbmcgdGhlIGFjY3VyYWN5IG9mIHRoZSBQTVUgZXZl
bnQgaXRzZWxmLAoKUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29u
LmNvLnVrPgoKQnV0IEkgdGhpbmsgdGhlcmUncyBzb21lIG1lcml0IGluIG15IHBvdiBzdGlsbCA6
KQotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
