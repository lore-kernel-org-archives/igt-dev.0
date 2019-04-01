Return-Path: <igt-dev-bounces@lists.freedesktop.org>
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <048b4fe9-02bd-0e00-5a3a-f82854dadeb1@linux.intel.com>
References: <20190331210930.24358-1-chris@chris-wilson.co.uk>
 <048b4fe9-02bd-0e00-5a3a-f82854dadeb1@linux.intel.com>
Message-ID: <155410835546.24691.5206805140029643846@skylake-alporthouse-com>
Date: Mon, 01 Apr 2019 09:45:55 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Idle before measuring
 idle
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0wNC0wMSAwOToxNToxOCkKPiAKPiBPbiAzMS8w
My8yMDE5IDIyOjA5LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBCZWZvcmUgdHJ5aW5nIHRvIG1l
YXN1cmUgdGhlIGJ1c3luZXNzIHJlcG9ydGluZyBmb3IgdGhlIGlkbGUgc3RhdGUsIG1ha2UKPiA+
IHN1cmUgdGhlIGdwdSBpcyBhY3R1YWxseSBpZGxlIGFuZCBub3Qgc3RpbGwgcnVubmluZyBhbnkg
YmFja2dvdW5kIHN5c3RlbQo+ID4gdGFzay4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMg
V2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gPiBDYzogVHZydGtvIFVyc3VsaW4g
PHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gICB0ZXN0cy9wZXJmX3BtdS5j
IHwgMSArCj4gPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBiL3Rlc3RzL3BlcmZfcG11LmMKPiA+IGluZGV4IDFh
MDhmNTY0Yi4uZWY2MWM0ZDQwIDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMvcGVyZl9wbXUuYwo+ID4g
KysrIGIvdGVzdHMvcGVyZl9wbXUuYwo+ID4gQEAgLTI2NCw2ICsyNjQsNyBAQCBzaW5nbGUoaW50
IGdlbV9mZCwgY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplLCB1bnNpZ25l
ZCBpbnQgZmxhZ3MpCj4gPiAgICAgICB1aW50NjRfdCB2YWw7Cj4gPiAgICAgICBpbnQgZmQ7Cj4g
PiAgIAo+ID4gKyAgICAgZ2VtX3F1aWVzY2VudF9ncHUoZ2VtX2ZkKTsKPiA+ICAgICAgIGZkID0g
b3Blbl9wbXUoSTkxNV9QTVVfRU5HSU5FX0JVU1koZS0+Y2xhc3MsIGUtPmluc3RhbmNlKSk7Cj4g
PiAgIAo+ID4gICAgICAgaWYgKGZsYWdzICYgVEVTVF9CVVNZKQo+ID4gCj4gCj4gSXQncyBva2F5
IGJ1dCB3aGVyZSBkaWQgaXQgZmFpbD8gQmVjYXVzZSBzdWJ0ZXN0IGhhcyBxdWllc2NlbnQgYXQg
dGhlIAo+IGVuZCwgYW5kIElHVCBoYXMgaXQgYXQgc3RhcnQuCgpIb25lc3RseSwgbm90IHN1cmUu
IEkgc3VzcGVjdCBpdCB3YXMganVzdCBhbm90aGVyIGlkbGUgd29ya2VyLiBPdGhlcgp0aGFuIHRo
ZSBzZWxmdGVzdCB3aG8ncyBtaXNzaW9uIGl0IGlzIHRvIGRldGVjdCBzdWNoIGVycm9ycywgdGhp
cyBtaWdodApiZSB0aGUgb25seSB0ZXN0IHRoYXQgaXMgc2Vuc2l0aXZlIHRvIHN0cmF5IHJlcXVl
c3RzIGJlaW5nIHJ1biBpbiB0aGUKYmFja2dyb3VuZC4gU28gaXQgbWlnaHQgYmUganVzdCBzaG9v
dGluZyB0aGUgY2FuYXJ5LgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
