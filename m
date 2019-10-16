Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464F26E93E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2019 11:31:45 +0000 (UTC)
References: <20191016111352.5212-1-petri.latvala@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <ccc8496d-68de-0392-3617-222d03d963b6@linux.intel.com>
Date: Wed, 16 Oct 2019 14:31:41 +0300
MIME-Version: 1.0
In-Reply-To: <20191016111352.5212-1-petri.latvala@intel.com>
Content-Language: en-PH
Subject: Re: [igt-dev] [PATCH i-g-t 1/4] runner: Produce skip instead of
 notrun for nonexisting tests
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
To: Petri Latvala <petri.latvala@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMTYvMTAvMjAxOSAxNDoxMywgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiBJZiBhIHRlc3Qgd2Fz
IGF0dGVtcHRlZCBidXQgZGlkbid0IGFjdHVhbGx5IGV4aXN0LCBtYWtlIGl0IHJlc3VsdCBpbiBh
Cj4gc2tpcCBpbnN0ZWFkIG9mIGEgbm90cnVuLiBUaGlzIGlzIHRvIGRpZmZlcmVudGlhdGUgdGhl
bSBmcm9tIHRoZSB0ZXN0cwo+IHRoYXQgd2UgZGlkbid0IGV2ZW4gYXR0ZW1wdCwgbGlrZSB0ZXN0
cyBhZnRlciBnZXR0aW5nIGEgbWFjaGluZQo+IGhhbmcuIFRoaXMgd2lsbCBpbXByb3ZlIGhhbmRs
aW5nIG9mIHN1YnRlc3RzIGZvciBHRU0gZW5naW5lcyB0aGF0Cj4gZG9uJ3QgZXhpc3QuCj4gCj4g
U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CgpB
Y2tlZC1ieTogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAbGludXguaW50ZWwuY29tPgoKPiBD
YzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+IENjOiBNYXJ0
aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIHJ1bm5lci9y
ZXN1bHRnZW4uYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9y
ZXN1bHRnZW4uYwo+IGluZGV4IDQ2YzlkOGQ1Li41ZmFhODU1NSAxMDA2NDQKPiAtLS0gYS9ydW5u
ZXIvcmVzdWx0Z2VuLmMKPiArKysgYi9ydW5uZXIvcmVzdWx0Z2VuLmMKPiBAQCAtNzMyLDcgKzcz
Miw3IEBAIHN0YXRpYyBjb25zdCBjaGFyICpyZXN1bHRfZnJvbV9leGl0Y29kZShpbnQgZXhpdGNv
ZGUpCj4gIAljYXNlIElHVF9FWElUX1NVQ0NFU1M6Cj4gIAkJcmV0dXJuICJwYXNzIjsKPiAgCWNh
c2UgSUdUX0VYSVRfSU5WQUxJRDoKPiAtCQlyZXR1cm4gIm5vdHJ1biI7Cj4gKwkJcmV0dXJuICJz
a2lwIjsKPiAgCWNhc2UgSU5DT01QTEVURV9FWElUQ09ERToKPiAgCQlyZXR1cm4gImluY29tcGxl
dGUiOwo+ICAJZGVmYXVsdDoKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
