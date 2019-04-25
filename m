Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E936C88FE2
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 09:54:16 +0000 (UTC)
References: <20190423130459.31594-1-simon.ser@intel.com>
 <20190423130459.31594-5-simon.ser@intel.com>
From: Martin Peres <martin.peres@linux.intel.com>
Message-ID: <72277c5b-12a2-a2d1-ddbf-eb53a9e0d87d@linux.intel.com>
Date: Thu, 25 Apr 2019 12:54:13 +0300
MIME-Version: 1.0
In-Reply-To: <20190423130459.31594-5-simon.ser@intel.com>
Content-Language: en-GB
Subject: Re: [igt-dev] [PATCH i-g-t v7 4/8] lib/igt_alsa: use variables to
 improve readability
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
To: Simon Ser <simon.ser@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gMjMvMDQvMjAxOSAxNjowNCwgU2ltb24gU2VyIHdyb3RlOgo+IE1vc3QgcGVvcGxlIGRvbid0
IGhhdmUgInJlbWVtYmVyIHdoYXQgdGhlIGxhc3QgdHdvIHBhcmFtZXRlcnMgb2YKPiBzbmRfcGNt
X3NldF9wYXJhbXMgYXJlIiBpbiB0aGVpciBsaWZlZ29hbHMgbGlzdC4gVXNlIHZhcmlhYmxlcyBz
byB0aGF0IGl0J3MKPiBjbGVhcmVyIHdoYXQgdGhvc2UgYXJlLgo+IAo+IFNpZ25lZC1vZmYtYnk6
IFNpbW9uIFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KClJldmlld2VkLWJ5OiBNYXJ0aW4gUGVy
ZXMgPG1hcnRpbi5wZXJlc0BsaW51eC5pbnRlbC5jb20+Cj4gLS0tCj4gIGxpYi9pZ3RfYWxzYS5j
IHwgNSArKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfYWxzYS5jIGIvbGliL2lndF9hbHNhLmMKPiBp
bmRleCAzYjFhOWU5MC4uYTQ3ODY4NmEgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9hbHNhLmMKPiAr
KysgYi9saWIvaWd0X2Fsc2EuYwo+IEBAIC00MjYsMTMgKzQyNiwxNiBAQCB2b2lkIGFsc2FfY29u
ZmlndXJlX291dHB1dChzdHJ1Y3QgYWxzYSAqYWxzYSwgaW50IGNoYW5uZWxzLAo+ICAJc25kX3Bj
bV90ICpoYW5kbGU7Cj4gIAlpbnQgcmV0Owo+ICAJaW50IGk7Cj4gKwlpbnQgc29mdF9yZXNhbXBs
ZSA9IDA7IC8qIERvbid0IGFsbG93IEFMU0EgdG8gcmVzYW1wbGUgKi8KPiArCXVuc2lnbmVkIGlu
dCBsYXRlbmN5ID0gMDsKPiAgCj4gIAlmb3IgKGkgPSAwOyBpIDwgYWxzYS0+b3V0cHV0X2hhbmRs
ZXNfY291bnQ7IGkrKykgewo+ICAJCWhhbmRsZSA9IGFsc2EtPm91dHB1dF9oYW5kbGVzW2ldOwo+
ICAKPiAgCQlyZXQgPSBzbmRfcGNtX3NldF9wYXJhbXMoaGFuZGxlLCBTTkRfUENNX0ZPUk1BVF9T
MTZfTEUsCj4gIAkJCQkJIFNORF9QQ01fQUNDRVNTX1JXX0lOVEVSTEVBVkVELAo+IC0JCQkJCSBj
aGFubmVscywgc2FtcGxpbmdfcmF0ZSwgMCwgMCk7Cj4gKwkJCQkJIGNoYW5uZWxzLCBzYW1wbGlu
Z19yYXRlLAo+ICsJCQkJCSBzb2Z0X3Jlc2FtcGxlLCBsYXRlbmN5KTsKPiAgCQlpZ3RfYXNzZXJ0
KHJldCA+PSAwKTsKPiAgCX0KPiAgCj4gCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
