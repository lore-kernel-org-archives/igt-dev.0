Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A0AA89AC0
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Aug 2019 13:31:39 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190827132110.16951-1-daniel.t.mrzyglod@intel.com>
 <20190827132110.16951-3-daniel.t.mrzyglod@intel.com>
In-Reply-To: <20190827132110.16951-3-daniel.t.mrzyglod@intel.com>
Message-ID: <156691269465.15406.4839149734836915826@skylake-alporthouse-com>
Date: Tue, 27 Aug 2019 14:31:34 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v8 2/3] lib/intel_mmio: add funtions for
 read/write register funtions
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
To: Daniel Mrzyglod <daniel.t.mrzyglod@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBEYW5pZWwgTXJ6eWdsb2QgKDIwMTktMDgtMjcgMTQ6MjE6MDkpCj4gICAgIFRoaXMg
cGF0Y2ggaXMgZmlyc3QgbW92ZSB0byBleHRlbmQgZnVuY3Rpb25hbGl0eSBvZiBpbnRlbF9tbWlv
IGxpYnJhcnkuCj4gICAgIFRoZXJlIHdhcyBsaW1pdGF0aW9uIGZvciAxIGRldmljZSwgYWRkaW5n
IHBvaW50ZXIgZm9yIElPIGZ1bmN0aW9ucyB0bwo+ICAgICBtbWFwZWQgYXJlYSBnaXZlcyB1cyBw
b3NzaWJpbGl0eSB0byB1c2UgdGhvc2UgSU8gZnVuY3Rpb25zIGZvciBvdGhlciBtbWFwZWQKPiAg
ICAgZGV2aWNlcy4KPiAKPiAgICAgdjg6IHJlbW92ZSB1bm5lY2Vzc2FyeSBjYXN0aW5ncwoKPiBk
aWZmIC0tZ2l0IGEvbGliL2ludGVsX21taW8uYyBiL2xpYi9pbnRlbF9tbWlvLmMKPiBpbmRleCBh
NTQ1OGFlYi4uYzI1N2Y3YTAgMTAwNjQ0Cj4gLS0tIGEvbGliL2ludGVsX21taW8uYwo+ICsrKyBi
L2xpYi9pbnRlbF9tbWlvLmMKPiBAQCAtNDA1LDMgKzQwNSwxMTAgQEAgdm9pZCBPVVRSRUc4KHVp
bnQzMl90IHJlZywgdWludDhfdCB2YWwpCj4gIHsKPiAgICAgICAgICooKHZvbGF0aWxlIHVpbnQ4
X3QgKilpZ3RfZ2xvYmFsX21taW8gKyByZWcpID0gdmFsOwoKKih2b2xhdGlsZSB1aW50MzJfdCAq
KShpZ3RfbW1pbyArIHJlZykgPSB2YWw7Cgo+ICB9Cj4gKwo+ICsKPiArLyoqCj4gKyAqIElOUkVH
X0RFVjoKPiArICogQGlndF9tbWlvIG1hcGVkIG1lbW9yeSBwb2ludGVyCj4gKyAqIEByZWc6IHJl
Z2lzdGVyIG9mZnNldAo+ICsgKgo+ICsgKiAzMi1iaXQgcmVhZCBvZiB0aGUgcmVnaXN0ZXIgYXQg
b2Zmc2V0IEByZWcuIFRoaXMgZnVuY3Rpb24gb25seSB3b3JrcyB3aGVuIHRoZQo+ICsgKiBuZXcg
cmVnaXN0ZXIgYWNjZXNzIGhlbHBlciBpcyBpbml0aWFsaXplZCB3aXRoIGludGVsX3JlZ2lzdGVy
X2FjY2Vzc19pbml0KCkuCj4gKyAqCj4gKyAqIFRoaXMgZnVuY3Rpb24gZGlyZWN0bHkgYWNjZXNz
ZXMgdGhlIGlndF9tbWlvIHdpdGhvdXQgc2FmZXR5IGNoZWNrcy4KPiArICoKPiArICogUmV0dXJu
czoKPiArICogVGhlIHZhbHVlIHJlYWQgZnJvbSB0aGUgcmVnaXN0ZXIuCj4gKyAqLwo+ICt1aW50
MzJfdCBJTlJFR19ERVYodm9pZCAqaWd0X21taW8sIHVpbnQzMl90IHJlZykKPiArewo+ICsgICAg
ICAgcmV0dXJuICooKHZvbGF0aWxlIGNoYXIgKilpZ3RfbW1pbyArIHJlZyk7CgpyZXR1cm4gKih2
b2xhdGlsZSB1aW50MzJfdCAqKShpZ3RfbW1pbyArIHJlZyk7CgpldGMKLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
