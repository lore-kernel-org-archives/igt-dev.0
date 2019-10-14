Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3575C89E3E
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Oct 2019 06:58:38 +0000 (UTC)
Date: Mon, 14 Oct 2019 09:58:35 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20191014065835.GJ4019@platvala-desk.ger.corp.intel.com>
References: <20191011131836.27778-1-chris@chris-wilson.co.uk>
 <20191011132237.28035-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011132237.28035-1-chris@chris-wilson.co.uk>
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDI6MjI6MzdQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFdoZW4gb3VyIHdhdGNoZG9nIGV4cGlyZXMgYW5kIHdlIGRlY2xhcmUgdGhlIHRlc3Qg
aGFzIHRpbWVkIG91dCwgd2Ugc2VuZAo+IGl0IGEgc2lnbmFsIHRvIHRlcm1pbmF0ZS4gVGhlIHRl
c3Qgd2lsbCBwcm9kdWNlIGEgYmFja3RyYWNlIHVwb24gcmVjZWlwdAo+IG9mIHRoYXQgc2lnbmFs
LCBidXQgb2Z0ZW4gdGltZXMgKGVzcGVjaWFsbHkgYXMgd2UgZG8gdGVzdCBhbmQgZGVidWcgdGhl
Cj4ga2VybmVsKSwgdGhlIHRlc3QgaXMgaHVuZyBpbnNpZGUgdGhlIGtlcm5lbC4gU28gd2UgbmVl
ZCB0aGUga2VybmVsIHN0YXRlCj4gdG8gc2VlIHdoZXJlIHRoZSBsaXZlL2RlYWRsb2NrIGlzIG9j
Y3VyaW5nLiBFbnRlciBzeXNycS10IHRvIHNob3cgdGhlCj4gYmFja3RyYWNlcyBvZiBhbGwgcHJv
Y2Vzc2VzIChhcyB0aGUgb25lIHdlIGFyZSBzZWFyY2hpbmcgZm9yIG1heSBiZQo+IHNsZWVwaW5n
KS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5j
by51az4KPiBDYzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gLS0t
Cj4gIHJ1bm5lci9leGVjdXRvci5jIHwgMjEgKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmls
ZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9leGVj
dXRvci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMKPiBpbmRleCAxYTAwMjM3ZmMuLjJiYjgyODI3OCAx
MDA2NDQKPiAtLS0gYS9ydW5uZXIvZXhlY3V0b3IuYwo+ICsrKyBiL3J1bm5lci9leGVjdXRvci5j
Cj4gQEAgLTYzOCw2ICs2MzgsMjUgQEAgc3RhdGljIGNvbnN0IGNoYXIgKmdldF9jbWRsaW5lKHBp
ZF90IHBpZCwgY2hhciAqYnVmLCBzc2l6ZV90IGxlbikKPiAgCXJldHVybiBidWY7Cj4gIH0KPiAg
Cj4gK3N0YXRpYyBib29sIHN5c3JxKGNoYXIgY21kKQo+ICt7Cj4gKwlib29sIHN1Y2Nlc3MgPSBm
YWxzZTsKPiArCWludCBmZDsKPiArCj4gKwlmZCA9IG9wZW4oIi9wcm9jL3N5c3JxLXRyaWdnZXIi
LCBPX1dST05MWSk7Cj4gKwlpZiAoZmQgPj0gMCkgewo+ICsJCXN1Y2Nlc3MgPSB3cml0ZShmZCwg
JmNtZCwgMSkgPT0gMTsKPiArCQljbG9zZShmZCk7Cj4gKwl9CgoKV2hlcmUgZG9lcyB0aGUgZHVt
cCBnbz8gQXJlIHdlIGFibGUgdG8gZ3JhYiBpdCBpbiB0aGUgdGVzdCdzIGRtZXNnPwoKLS0gClBl
dHJpIExhdHZhbGEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
