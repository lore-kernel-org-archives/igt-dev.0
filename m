Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (unknown [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97A3A6E17F
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:35:21 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <157416170876.10169.1533103631591014444@skylake-alporthouse-com>
 <6a08f957-6897-0db2-1ee7-e2b49e40744e@linux.intel.com>
In-Reply-To: <6a08f957-6897-0db2-1ee7-e2b49e40744e@linux.intel.com>
Message-ID: <157416330678.10169.7529772480987205839@skylake-alporthouse-com>
Date: Tue, 19 Nov 2019 11:35:06 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] test/i915: gem_ctx_exec: Fix for
 using context engine map
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBUdnJ0a28gVXJzdWxpbiAoMjAxOS0xMS0xOSAxMToyNDoxNykKPiAKPiBPbiAxOS8x
MS8yMDE5IDExOjA4LCBDaHJpcyBXaWxzb24gd3JvdGU6Cj4gPiBRdW90aW5nIFZlbmthdGEgU2Fu
ZGVlcCBEaGFuYWxha290YSAoMjAxOS0xMS0xOSAxMTowMToxNikKPiA+PiBTaW5jZSBlbmdpbmVz
IGFyZSBub3cgbG9va2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5lIG1hcCwKPiA+PiBjb250
ZXh0IHNob3VsZCBiZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5nIGluIGV4ZWNidWYu
Cj4gPj4KPiA+PiBGaXhlczogMWE3ZjJlNTkgaWd0KCJnZW1fY3R4X2V4ZWM6IHVzZSB0aGUgZ2Vt
X2VuZ2luZV90b3BvbG9neSIKPiA+Pgo+ID4+IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGlu
dGVsLmNvbT4KPiA+PiBDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Cj4gPj4gQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBsaW51eC5pbnRlbC5jb20+
Cj4gPj4gU2lnbmVkLW9mZi1ieTogVmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2ZW5rYXRh
LnMuZGhhbmFsYWtvdGFAaW50ZWwuY29tPgo+ID4+IC0tLQo+ID4+ICAgdGVzdHMvaTkxNS9nZW1f
Y3R4X2V4ZWMuYyB8IDEgKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4g
Pj4KPiA+PiBkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYyBiL3Rlc3RzL2k5
MTUvZ2VtX2N0eF9leGVjLmMKPiA+PiBpbmRleCA2YzJjZDkyMi4uMmJmNDdjZjIgMTAwNjQ0Cj4g
Pj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+ID4+ICsrKyBiL3Rlc3RzL2k5MTUv
Z2VtX2N0eF9leGVjLmMKPiA+PiBAQCAtMTMyLDYgKzEzMiw3IEBAIHN0YXRpYyB2b2lkIGludmFs
aWRfY29udGV4dChpbnQgZmQsIGNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAq
ZSwKPiA+PiAgICAgICAgICBnZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYpOwo+ID4+ICAgCj4gPj4g
ICAgICAgICAgY3R4ID0gZ2VtX2NvbnRleHRfY3JlYXRlKGZkKTsKPiA+PiArICAgICAgIGdlbV9j
b250ZXh0X3NldF9hbGxfZW5naW5lcyhmZCwgY3R4KTsKPiA+IAo+ID4gSXJyZWxldmFudC4KPiAK
PiBJIGd1ZXNzIGl0IGlzIGEgYml0LCBidXQgaXQgY29tcGxldGVzIHRoZSB0ZXN0IGNvbnZlcnNp
b24gdG8gYmUgY29ycmVjdC4gCj4gWW91IHdvdWxkIHdhbnQgdG8gc3BsaXQgdGhlIGxlZ2FjeS12
cy1uZXcgZW5naW5lIHNlbGVjdGlvbiBpbiB0aGlzIG9uZT8KCk5vLCB0aGVyZSBzaG91bGRuJ3Qg
YmUgYSBwZXItZW5naW5lIGNvbXBvbmVudCB0byB0aGlzIHRlc3QgYXQgYWxsLgpUaGUgd2F5IHdl
IGhhdmUgc2VwYXJhdGVkIHRoZSBjb250ZXh0IHN0YXRlIGlzIHRoYXQgaXQgaXMgYWtpbiB0byB0
aGUKcHJvY2VzcyBzdGF0ZS4gTm93IHdoZXRoZXIgb3Igbm90IHRoZSBjb250ZXh0IGhhcyBhbiBl
bmdpbmUgaXMgYW5vdGhlcgpxdWVzdGlvbiAoYW5kIGFuc3dlcmVkIGVsc2V3aGVyZSksIHRoZSBx
dWVzdGlvbiBpcyBtb3N0IGNlcnRhaW5seSBub3QKd2hldGhlciBhbiBlbmdpbmUgaGFzIGEgY29u
dGV4dCBhcyBpcyBiZWluZyBhc2tlZCBoZXJlLgotQ2hyaXMKIApfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXY=
