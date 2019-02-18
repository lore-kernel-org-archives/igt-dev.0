Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DA4489186
 for <igt-dev@lists.freedesktop.org>; Mon, 18 Feb 2019 10:57:58 +0000 (UTC)
Date: Mon, 18 Feb 2019 12:57:55 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190218105755.GY4038@platvala-desk.ger.corp.intel.com>
References: <20190215004043.21500-1-stuart.summers@intel.com>
 <20190215004043.21500-2-stuart.summers@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190215004043.21500-2-stuart.summers@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] i915/kms_chamelium: Require gen < 9
 for VGA testing
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
To: Stuart Summers <stuart.summers@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTQsIDIwMTkgYXQgMDQ6NDA6NDJQTSAtMDgwMCwgU3R1YXJ0IFN1bW1lcnMg
dmlhIGlndC1kZXYgd3JvdGU6Cj4gRnJvbTogU3R1YXJ0IFN1bW1lcnMgPGpzc3VtbWVyQGpzc3Vt
bWVyLWRlc2sxLmFtci5jb3JwLmludGVsLmNvbT4KPiAKPiBWR0Egbm90IHN1cHBvcnRlZCBvbiBn
ZW4gOSBhbmQgYWJvdmUuIEFkZCBhbiBleHBsaWNpdCByZXF1aXJlbWVudAo+IHRvIHNraXAgVkdB
IHRlc3RzIHRvIGEgQ2hhbWVsaXVtIG9uIGxhdGVyIGdlbnMuCj4gCj4gU2lnbmVkLW9mZi1ieTog
U3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4KPiAtLS0KPiAgdGVzdHMv
a21zX2NoYW1lbGl1bS5jIHwgMiArKwo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jaGFtZWxpdW0uYyBiL3Rlc3RzL2ttc19jaGFt
ZWxpdW0uYwo+IGluZGV4IDY0Zjg3ZDNhZS4uYWI4OWM1ZDQ3IDEwMDY0NAo+IC0tLSBhL3Rlc3Rz
L2ttc19jaGFtZWxpdW0uYwo+ICsrKyBiL3Rlc3RzL2ttc19jaGFtZWxpdW0uYwo+IEBAIC0xMDE1
LDYgKzEwMTUsOCBAQCBpZ3RfbWFpbgo+ICAKPiAgCWlndF9zdWJ0ZXN0X2dyb3VwIHsKPiAgCQlp
Z3RfZml4dHVyZSB7Cj4gKwkJCWludCBnZW4gPSBpbnRlbF9nZW4oaW50ZWxfZ2V0X2RybV9kZXZp
ZChkYXRhLmRybV9mZCkpOwo+ICsJCQlpZ3RfcmVxdWlyZV9mKGdlbiA8IDksICJWR0Egbm90IHN1
cHBvcnRlZFxuIik7Cj4gIAkJCXJlcXVpcmVfY29ubmVjdG9yX3ByZXNlbnQoCj4gIAkJCSAgICAm
ZGF0YSwgRFJNX01PREVfQ09OTkVDVE9SX1ZHQSk7CgpUaGUgb2J2aW91cyBmaXJzdCBjb21tZW50
IGlzIHRoYXQgeW91J3JlIG5vdCBuZWNlc3NhcmlseSBydW5uaW5nIG9uIGFuCmludGVsIGRldmlj
ZS4gQnV0IGxldCdzIHB1dCB0aGF0IGFzaWRlLCB0aGVyZSdzIGEgbW9yZSBpbXBvcnRhbnQKcXVl
c3Rpb24uCgpXaGF0IHByb2JsZW0gZG9lcyB0aGlzIHNvbHZlPyBUaGUgbGluZSBkaXJlY3RseSBh
ZnRlciBjaGVja3MgZm9yIGEgVkdBCmNvbm5lY3RvciBiZWluZyBwcmVzZW50LiBWR0EgdmlhIERQ
IG5vdCBnb29kIGVub3VnaD8gSWYgdGhlcmUncwpwcm9ibGVtcyB3aXRoIHRoYXQsIHN1cmVseSB0
aGVyZSBhcmUgYmV0dGVyIHdheXMgdG8gZ2V0IGFyb3VuZCBpdCB0aGFuCmlnbm9yaW5nIGl0LgoK
Ci0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
