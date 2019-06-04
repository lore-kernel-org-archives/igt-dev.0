Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB66489864
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 08:51:19 +0000 (UTC)
References: <20190604084612.13950-1-petri.latvala@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Message-ID: <0e81bb65-c04c-749d-dd64-9bfdd71a9c5e@linux.intel.com>
Date: Tue, 4 Jun 2019 09:51:17 +0100
MIME-Version: 1.0
In-Reply-To: <20190604084612.13950-1-petri.latvala@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] perf_pmu: Actually require engines again
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Ck9uIDA0LzA2LzIwMTkgMDk6NDYsIFBldHJpIExhdHZhbGEgd3JvdGU6Cj4gSW4gY29tbWl0IDMy
ZTQyMWY2Zjc0YSAoInRlc3Q6IHBlcmZfcG11OiB1c2UgdGhlIGdlbV9lbmdpbmVfdG9wb2xvZ3kK
PiBsaWJyYXJ5IikgcGVyZl9wbXUgd2FzIGNvbnZlcnRlZCB0byB1c2UgZ2VtX2NvbnRleHRfaGFz
X2VuZ2luZSgpCj4gaW5zdGVhZCBvZiBnZW1fcmVxdWlyZV9lbmdpbmUsIGJ1dCBtaXNzaW5nIHRo
ZSBjcnVjaWFsIHBhcnQgb2YKPiBpZ3RfcmVxdWlyZSgpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+IENjOiBUdnJ0a28gVXJzdWxp
biA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgo+IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRp
QGludGVsLmNvbT4KPiAtLS0KPiAgIHRlc3RzL3BlcmZfcG11LmMgfCA2ICsrKy0tLQo+ICAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvdGVzdHMvcGVyZl9wbXUuYyBiL3Rlc3RzL3BlcmZfcG11LmMKPiBpbmRleCA3MmI5MTY2
YS4uZmRhZjk2ZGEgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvcGVyZl9wbXUuYwo+ICsrKyBiL3Rlc3Rz
L3BlcmZfcG11LmMKPiBAQCAtMTcxNCw3ICsxNzE0LDcgQEAgaWd0X21haW4KPiAgIAo+ICAgCQlp
Z3Rfc3VidGVzdF9ncm91cCB7Cj4gICAJCQlpZ3RfZml4dHVyZSB7Cj4gLQkJCQlnZW1fY29udGV4
dF9oYXNfZW5naW5lKGZkLCAwLCBlLT5mbGFncyk7Cj4gKwkJCQlpZ3RfcmVxdWlyZShnZW1fY29u
dGV4dF9oYXNfZW5naW5lKGZkLCAwLCBlLT5mbGFncykpOwoKSG1tbS4uIGlzIHRoZSBsaW5lIGV2
ZW4gbmVlZGVkPyBJIHRoaW5rIGl0ZXJhdG9yIHdpbGwgb25seSBjb250YWluIAphdmFpbGFibGUg
ZW5naW5lcy4KClJlZ2FyZHMsCgpUdnJ0a28KCj4gICAJCQl9Cj4gICAKPiAgIAkJCS8qKgo+IEBA
IC0xOTAzLDggKzE5MDMsOCBAQCBpZ3RfbWFpbgo+ICAgCQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2Vu
Z2luZShyZW5kZXJfZmQsIGUpIHsKPiAgIAkJCWlndF9zdWJ0ZXN0X2dyb3VwIHsKPiAgIAkJCQlp
Z3RfZml4dHVyZSB7Cj4gLQkJCQkJZ2VtX2NvbnRleHRfaGFzX2VuZ2luZShyZW5kZXJfZmQsCj4g
LQkJCQkJCQkgICAwLCBlLT5mbGFncyk7Cj4gKwkJCQkJaWd0X3JlcXVpcmUoZ2VtX2NvbnRleHRf
aGFzX2VuZ2luZShyZW5kZXJfZmQsCj4gKwkJCQkJCQkJCSAgIDAsIGUtPmZsYWdzKSk7Cj4gICAJ
CQkJfQo+ICAgCj4gICAJCQkJaWd0X3N1YnRlc3RfZigicmVuZGVyLW5vZGUtYnVzeS0lcyIsIGUt
Pm5hbWUpCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
