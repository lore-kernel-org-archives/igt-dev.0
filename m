Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 881566EE1C
 for <igt-dev@lists.freedesktop.org>; Wed, 18 Sep 2019 07:31:58 +0000 (UTC)
Date: Wed, 18 Sep 2019 09:31:56 +0200
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190918073156.GI25026@kdec5-desk.ger.corp.intel.com>
References: <20190917091353.31149-1-katarzyna.dec@intel.com>
 <20190917091353.31149-4-katarzyna.dec@intel.com>
 <878sqm2myn.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <878sqm2myn.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] HAX: run gpgpu_fill and media_fill
 in BAT
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBTZXAgMTcsIDIwMTkgYXQgMTA6Mjc6MjhQTSAtMDcwMCwgQXNodXRvc2ggRGl4aXQg
d3JvdGU6Cj4gVGhlcmUgYXJlIG5vIG90aGVyIGNvbW1pdHMgd2l0aCBIQVggaW4gdGhlIGNvbW1p
dCBtZXNzYWdlLiBJZiB0aGlzIHBhdGNoIGlzCj4gZ29pbmcgdG8gYmUgcHVzaGVkIGl0IHdpbGwg
bmVlZCBhIFNpZ25lZC1vZmYtYnkuCgpUaGlzIHBhdGNoIGlzIG9ubHkgZm9yIGFkZGluZyB0ZXN0
cyB0aGF0IGFyZSBub3Qgb24gZmFzdCBmZWVkYmFjayBhbmQgYXJlCmNoYW5nZWQgYnkgdGhpcyBz
ZXJpZXMgKG1lZGlhX2ZpbGwgYW5kIGdwZ3B1X2ZpbGwpIHRvIGJlIHJ1biBieSBwYXRjaHdvcmsu
ClRoaXMgcGF0Y2ggaXMgbm90IGdvaW5nIHRvIGJlIG1lcmdlZC4KCllvdSBjYW4gdHJ5IHRoaXMg
dG9vIGlmIHlvdSB3aWxsIHNlbmQgc29tZSBzZXJpZXMgdG8gaWd0LWRldi4KCkthc2lhIDopCj4g
Cj4gT24gVHVlLCAxNyBTZXAgMjAxOSAwMjoxMzo1MyAtMDcwMCwgS2F0YXJ6eW5hIERlYyB3cm90
ZToKPiA+Cj4gPiAtLS0KPiA+ICB0ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0
IHwgMyArKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ludGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVz
dGxpc3QgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRlc3RsaXN0Cj4gPiBpbmRleCBl
NzhlN2ZkMC4uNTk2ZmYwNDIgMTAwNjQ0Cj4gPiAtLS0gYS90ZXN0cy9pbnRlbC1jaS9mYXN0LWZl
ZWRiYWNrLnRlc3RsaXN0Cj4gPiArKysgYi90ZXN0cy9pbnRlbC1jaS9mYXN0LWZlZWRiYWNrLnRl
c3RsaXN0Cj4gPiBAQCAtMSw1ICsxLDYgQEAKPiA+ICAjIEtlZXAgYWxwaGFiZXRpY2FsbHkgc29y
dGVkIGJ5IGRlZmF1bHQKPiA+IC0KPiA+ICtpZ3RAZ2VtX21lZGlhX2ZpbGwKPiA+ICtpZ3RAZ2Vt
X2dwZ3B1X2ZpbGwKPiA+ICBpZ3RAY29yZV9hdXRoQGJhc2ljLWF1dGgKPiA+ICBpZ3RAZGVidWdm
c190ZXN0QHJlYWRfYWxsX2VudHJpZXMKPiA+ICBpZ3RAZ2VtX2Jhc2ljQGJhZC1jbG9zZQo+ID4g
LS0KPiA+IDIuMjAuMQo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gPiBpZ3QtZGV2IG1haWxpbmcgbGlzdAo+ID4gaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
