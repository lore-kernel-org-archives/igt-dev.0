Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9760A6E51B
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:24:20 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
 <157416170876.10169.1533103631591014444@skylake-alporthouse-com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <6a08f957-6897-0db2-1ee7-e2b49e40744e@linux.intel.com>
Date: Tue, 19 Nov 2019 11:24:17 +0000
MIME-Version: 1.0
In-Reply-To: <157416170876.10169.1533103631591014444@skylake-alporthouse-com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] test/i915: gem_ctx_exec: Fix for
 using context engine map
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
To: Chris Wilson <chris@chris-wilson.co.uk>, Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE5LzExLzIwMTkgMTE6MDgsIENocmlzIFdpbHNvbiB3cm90ZToKPiBRdW90aW5nIFZlbmth
dGEgU2FuZGVlcCBEaGFuYWxha290YSAoMjAxOS0xMS0xOSAxMTowMToxNikKPj4gU2luY2UgZW5n
aW5lcyBhcmUgbm93IGxvb2tlZCB1cCBiYXNlZCBvbiBjb250ZXh0IGVuZ2luZSBtYXAsCj4+IGNv
bnRleHQgc2hvdWxkIGJlIHNldHVwIHdpdGggZW5naW5lcyBiZWZvcmUgdXNpbmcgaW4gZXhlY2J1
Zi4KPj4KPj4gRml4ZXM6IDFhN2YyZTU5IGlndCgiZ2VtX2N0eF9leGVjOiB1c2UgdGhlIGdlbV9l
bmdpbmVfdG9wb2xvZ3kiCj4+Cj4+IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNv
bT4KPj4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+PiBDYzog
VHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4KPj4gU2lnbmVk
LW9mZi1ieTogVmVua2F0YSBTYW5kZWVwIERoYW5hbGFrb3RhIDx2ZW5rYXRhLnMuZGhhbmFsYWtv
dGFAaW50ZWwuY29tPgo+PiAtLS0KPj4gICB0ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIHwgMSAr
Cj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4+Cj4+IGRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIGIvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+PiBp
bmRleCA2YzJjZDkyMi4uMmJmNDdjZjIgMTAwNjQ0Cj4+IC0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2N0
eF9leGVjLmMKPj4gKysrIGIvdGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYwo+PiBAQCAtMTMyLDYg
KzEzMiw3IEBAIHN0YXRpYyB2b2lkIGludmFsaWRfY29udGV4dChpbnQgZmQsIGNvbnN0IHN0cnVj
dCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwKPj4gICAgICAgICAgZ2VtX2V4ZWNidWYoZmQs
ICZleGVjYnVmKTsKPj4gICAKPj4gICAgICAgICAgY3R4ID0gZ2VtX2NvbnRleHRfY3JlYXRlKGZk
KTsKPj4gKyAgICAgICBnZW1fY29udGV4dF9zZXRfYWxsX2VuZ2luZXMoZmQsIGN0eCk7Cj4gCj4g
SXJyZWxldmFudC4KCkkgZ3Vlc3MgaXQgaXMgYSBiaXQsIGJ1dCBpdCBjb21wbGV0ZXMgdGhlIHRl
c3QgY29udmVyc2lvbiB0byBiZSBjb3JyZWN0LiAKWW91IHdvdWxkIHdhbnQgdG8gc3BsaXQgdGhl
IGxlZ2FjeS12cy1uZXcgZW5naW5lIHNlbGVjdGlvbiBpbiB0aGlzIG9uZT8KClJlZ2FyZHMsCgpU
dnJ0a28KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
