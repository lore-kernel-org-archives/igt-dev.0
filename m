Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8271589317
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 19:46:34 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20190221192745.31178-1-antonio.argenziano@intel.com>
 <20190221192745.31178-2-antonio.argenziano@intel.com>
In-Reply-To: <20190221192745.31178-2-antonio.argenziano@intel.com>
Message-ID: <155077838923.4937.5133375546234436543@skylake-alporthouse-com>
Date: Thu, 21 Feb 2019 19:46:29 +0000
Subject: Re: [igt-dev] [RFC 1/5] tests/prime_self_import: Swap gtt mapping
 for cpu
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTktMDItMjEgMTk6Mjc6NDEpCj4gVGhlIHRl
c3QgdXNlcyBndHQgbWFwcGluZyB0byBjaGVjayB0d28gQk9zIGhhdmUgdGhlIHNhbWUgY29udGVu
dCwgc2luY2UKPiBpdCBzZWVtcyB0aGVyZSBpcyBubyBjb250ZW50aW9uIG9uIHRoZSBCT3MgdXNl
IGNwdSBtYXBwaW5nIHRvIG1ha2UgaXQKPiBjb21wYXRpYmxlIHdpdGggcGxhdGZvcm1zIHRoYXQg
ZG8gbm90IGhhdmUgYSBtYXBwYWJsZSBhcGVydHVyZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbnRv
bmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gLS0tCj4gIHRl
c3RzL3ByaW1lX3NlbGZfaW1wb3J0LmMgfCA0ICsrLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcHJpbWVf
c2VsZl9pbXBvcnQuYyBiL3Rlc3RzL3ByaW1lX3NlbGZfaW1wb3J0LmMKPiBpbmRleCA4YzRmNTMy
MS4uOTA1ZmZmZmIgMTAwNjQ0Cj4gLS0tIGEvdGVzdHMvcHJpbWVfc2VsZl9pbXBvcnQuYwo+ICsr
KyBiL3Rlc3RzL3ByaW1lX3NlbGZfaW1wb3J0LmMKPiBAQCAtNTksOCArNTksOCBAQCBjaGVja19i
byhpbnQgZmQxLCB1aW50MzJfdCBoYW5kbGUxLCBpbnQgZmQyLCB1aW50MzJfdCBoYW5kbGUyKQo+
ICAgICAgICAgY2hhciAqcHRyMSwgKnB0cjI7Cj4gICAgICAgICBpbnQgaTsKPiAgCj4gLSAgICAg
ICBwdHIxID0gZ2VtX21tYXBfX2d0dChmZDEsIGhhbmRsZTEsIEJPX1NJWkUsIFBST1RfUkVBRCB8
IFBST1RfV1JJVEUpOwo+IC0gICAgICAgcHRyMiA9IGdlbV9tbWFwX19ndHQoZmQyLCBoYW5kbGUy
LCBCT19TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsKPiArICAgICAgIHB0cjEgPSBnZW1f
bW1hcF9fY3B1KGZkMSwgaGFuZGxlMSwgMCwgQk9fU0laRSwgUFJPVF9SRUFEIHwgUFJPVF9XUklU
RSk7Cj4gKyAgICAgICBwdHIyID0gZ2VtX21tYXBfX2NwdShmZDIsIGhhbmRsZTIsIDAsIEJPX1NJ
WkUsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOwoKc2V0X2RvbWFpbigpIHdvdWxkIGJlIHJlcXVp
cmVkIGZvciBwZWRhZ29neSwgbW1hcF9fZ3R0IGlzIG1hZ2ljLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
