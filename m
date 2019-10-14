Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC75689CA2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2019 07:12:12 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20191014065835.GJ4019@platvala-desk.ger.corp.intel.com>
References: <20191011131836.27778-1-chris@chris-wilson.co.uk>
 <20191011132237.28035-1-chris@chris-wilson.co.uk>
 <20191014065835.GJ4019@platvala-desk.ger.corp.intel.com>
Message-ID: <157103712600.31572.950530687744488061@skylake-alporthouse-com>
Date: Mon, 14 Oct 2019 08:12:06 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v3] runner: Show kernel state on
 detecting test timeout
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBQZXRyaSBMYXR2YWxhICgyMDE5LTEwLTE0IDA3OjU4OjM1KQo+IE9uIEZyaSwgT2N0
IDExLCAyMDE5IGF0IDAyOjIyOjM3UE0gKzAxMDAsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFdo
ZW4gb3VyIHdhdGNoZG9nIGV4cGlyZXMgYW5kIHdlIGRlY2xhcmUgdGhlIHRlc3QgaGFzIHRpbWVk
IG91dCwgd2Ugc2VuZAo+ID4gaXQgYSBzaWduYWwgdG8gdGVybWluYXRlLiBUaGUgdGVzdCB3aWxs
IHByb2R1Y2UgYSBiYWNrdHJhY2UgdXBvbiByZWNlaXB0Cj4gPiBvZiB0aGF0IHNpZ25hbCwgYnV0
IG9mdGVuIHRpbWVzIChlc3BlY2lhbGx5IGFzIHdlIGRvIHRlc3QgYW5kIGRlYnVnIHRoZQo+ID4g
a2VybmVsKSwgdGhlIHRlc3QgaXMgaHVuZyBpbnNpZGUgdGhlIGtlcm5lbC4gU28gd2UgbmVlZCB0
aGUga2VybmVsIHN0YXRlCj4gPiB0byBzZWUgd2hlcmUgdGhlIGxpdmUvZGVhZGxvY2sgaXMgb2Nj
dXJpbmcuIEVudGVyIHN5c3JxLXQgdG8gc2hvdyB0aGUKPiA+IGJhY2t0cmFjZXMgb2YgYWxsIHBy
b2Nlc3NlcyAoYXMgdGhlIG9uZSB3ZSBhcmUgc2VhcmNoaW5nIGZvciBtYXkgYmUKPiA+IHNsZWVw
aW5nKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5j
b20+Cj4gPiAtLS0KPiA+ICBydW5uZXIvZXhlY3V0b3IuYyB8IDIxICsrKysrKysrKysrKysrKysr
KysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYg
LS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBiL3J1bm5lci9leGVjdXRvci5jCj4gPiBpbmRleCAx
YTAwMjM3ZmMuLjJiYjgyODI3OCAxMDA2NDQKPiA+IC0tLSBhL3J1bm5lci9leGVjdXRvci5jCj4g
PiArKysgYi9ydW5uZXIvZXhlY3V0b3IuYwo+ID4gQEAgLTYzOCw2ICs2MzgsMjUgQEAgc3RhdGlj
IGNvbnN0IGNoYXIgKmdldF9jbWRsaW5lKHBpZF90IHBpZCwgY2hhciAqYnVmLCBzc2l6ZV90IGxl
bikKPiA+ICAgICAgIHJldHVybiBidWY7Cj4gPiAgfQo+ID4gIAo+ID4gK3N0YXRpYyBib29sIHN5
c3JxKGNoYXIgY21kKQo+ID4gK3sKPiA+ICsgICAgIGJvb2wgc3VjY2VzcyA9IGZhbHNlOwo+ID4g
KyAgICAgaW50IGZkOwo+ID4gKwo+ID4gKyAgICAgZmQgPSBvcGVuKCIvcHJvYy9zeXNycS10cmln
Z2VyIiwgT19XUk9OTFkpOwo+ID4gKyAgICAgaWYgKGZkID49IDApIHsKPiA+ICsgICAgICAgICAg
ICAgc3VjY2VzcyA9IHdyaXRlKGZkLCAmY21kLCAxKSA9PSAxOwo+ID4gKyAgICAgICAgICAgICBj
bG9zZShmZCk7Cj4gPiArICAgICB9Cj4gCj4gCj4gV2hlcmUgZG9lcyB0aGUgZHVtcCBnbz8gQXJl
IHdlIGFibGUgdG8gZ3JhYiBpdCBpbiB0aGUgdGVzdCdzIGRtZXNnPwoKSW50byB0aGUgZG1lc2cu
Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
