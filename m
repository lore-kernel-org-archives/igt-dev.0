Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11A1D896F7
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 09:08:35 +0000 (UTC)
Date: Wed, 5 Jun 2019 12:08:32 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190605090832.GB22949@platvala-desk.ger.corp.intel.com>
References: <20190604084612.13950-1-petri.latvala@intel.com>
 <0e81bb65-c04c-749d-dd64-9bfdd71a9c5e@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e81bb65-c04c-749d-dd64-9bfdd71a9c5e@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] perf_pmu: Actually require engines again
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKdW4gMDQsIDIwMTkgYXQgMDk6NTE6MTdBTSArMDEwMCwgVHZydGtvIFVyc3VsaW4g
d3JvdGU6Cj4gCj4gT24gMDQvMDYvMjAxOSAwOTo0NiwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+
IEluIGNvbW1pdCAzMmU0MjFmNmY3NGEgKCJ0ZXN0OiBwZXJmX3BtdTogdXNlIHRoZSBnZW1fZW5n
aW5lX3RvcG9sb2d5Cj4gPiBsaWJyYXJ5IikgcGVyZl9wbXUgd2FzIGNvbnZlcnRlZCB0byB1c2Ug
Z2VtX2NvbnRleHRfaGFzX2VuZ2luZSgpCj4gPiBpbnN0ZWFkIG9mIGdlbV9yZXF1aXJlX2VuZ2lu
ZSwgYnV0IG1pc3NpbmcgdGhlIGNydWNpYWwgcGFydCBvZgo+ID4gaWd0X3JlcXVpcmUoKS4KPiA+
IAo+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5j
b20+Cj4gPiBDYzogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KPiA+
IENjOiBBbmRpIFNoeXRpIDxhbmRpLnNoeXRpQGludGVsLmNvbT4KPiA+IC0tLQo+ID4gICB0ZXN0
cy9wZXJmX3BtdS5jIHwgNiArKystLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11
LmMgYi90ZXN0cy9wZXJmX3BtdS5jCj4gPiBpbmRleCA3MmI5MTY2YS4uZmRhZjk2ZGEgMTAwNjQ0
Cj4gPiAtLS0gYS90ZXN0cy9wZXJmX3BtdS5jCj4gPiArKysgYi90ZXN0cy9wZXJmX3BtdS5jCj4g
PiBAQCAtMTcxNCw3ICsxNzE0LDcgQEAgaWd0X21haW4KPiA+ICAgCQlpZ3Rfc3VidGVzdF9ncm91
cCB7Cj4gPiAgIAkJCWlndF9maXh0dXJlIHsKPiA+IC0JCQkJZ2VtX2NvbnRleHRfaGFzX2VuZ2lu
ZShmZCwgMCwgZS0+ZmxhZ3MpOwo+ID4gKwkJCQlpZ3RfcmVxdWlyZShnZW1fY29udGV4dF9oYXNf
ZW5naW5lKGZkLCAwLCBlLT5mbGFncykpOwo+IAo+IEhtbW0uLiBpcyB0aGUgbGluZSBldmVuIG5l
ZWRlZD8gSSB0aGluayBpdGVyYXRvciB3aWxsIG9ubHkgY29udGFpbiBhdmFpbGFibGUKPiBlbmdp
bmVzLgoKCkdvb2QgcXVlc3Rpb24sIGxvb2tzIGxpa2Ugbm8uCgpEb2VzIHRoZSBpdGVyYXRvciBv
bmx5IGdpdmUgYXZhaWxhYmxlIGVuZ2luZXMgb24geWUgb2xkZSBrZXJuZWxzIHRvbz8KCgotLSAK
UGV0cmkgTGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
