Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C991C6E188
 for <igt-dev@lists.freedesktop.org>; Tue, 19 Nov 2019 11:15:11 +0000 (UTC)
References: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <8b5fb952-c8ab-9203-ba77-9debaec72589@linux.intel.com>
Date: Tue, 19 Nov 2019 11:15:08 +0000
MIME-Version: 1.0
In-Reply-To: <20191119110117.13209-1-venkata.s.dhanalakota@intel.com>
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
To: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDE5LzExLzIwMTkgMTE6MDEsIFZlbmthdGEgU2FuZGVlcCBEaGFuYWxha290YSB3cm90ZToK
PiBTaW5jZSBlbmdpbmVzIGFyZSBub3cgbG9va2VkIHVwIGJhc2VkIG9uIGNvbnRleHQgZW5naW5l
IG1hcCwKPiBjb250ZXh0IHNob3VsZCBiZSBzZXR1cCB3aXRoIGVuZ2luZXMgYmVmb3JlIHVzaW5n
IGluIGV4ZWNidWYuCj4gCj4gRml4ZXM6IDFhN2YyZTU5IGlndCgiZ2VtX2N0eF9leGVjOiB1c2Ug
dGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kiCj4gCj4gQ2M6IEFuZGkgU2h5dGkgPGFuZGkuc2h5dGlA
aW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
PiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGxpbnV4LmludGVsLmNvbT4KPiBT
aWduZWQtb2ZmLWJ5OiBWZW5rYXRhIFNhbmRlZXAgRGhhbmFsYWtvdGEgPHZlbmthdGEucy5kaGFu
YWxha290YUBpbnRlbC5jb20+Cj4gLS0tCj4gICB0ZXN0cy9pOTE1L2dlbV9jdHhfZXhlYy5jIHwg
MSArCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPiAKPiBkaWZmIC0tZ2l0IGEv
dGVzdHMvaTkxNS9nZW1fY3R4X2V4ZWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKPiBp
bmRleCA2YzJjZDkyMi4uMmJmNDdjZjIgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvaTkxNS9nZW1fY3R4
X2V4ZWMuYwo+ICsrKyBiL3Rlc3RzL2k5MTUvZ2VtX2N0eF9leGVjLmMKPiBAQCAtMTMyLDYgKzEz
Miw3IEBAIHN0YXRpYyB2b2lkIGludmFsaWRfY29udGV4dChpbnQgZmQsIGNvbnN0IHN0cnVjdCBp
bnRlbF9leGVjdXRpb25fZW5naW5lMiAqZSwKPiAgIAlnZW1fZXhlY2J1ZihmZCwgJmV4ZWNidWYp
Owo+ICAgCj4gICAJY3R4ID0gZ2VtX2NvbnRleHRfY3JlYXRlKGZkKTsKPiArCWdlbV9jb250ZXh0
X3NldF9hbGxfZW5naW5lcyhmZCwgY3R4KTsKPiAgIAlpOTE1X2V4ZWNidWZmZXIyX3NldF9jb250
ZXh0X2lkKGV4ZWNidWYsIGN0eCk7Cj4gICAJZ2VtX2V4ZWNidWYoZmQsICZleGVjYnVmKTsKPiAg
IAo+IAoKUmV2aWV3ZWQtYnk6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5j
b20+CgpSZWdhcmRzLAoKVHZydGtvCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
