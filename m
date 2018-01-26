Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 511C16E443
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2018 09:36:11 +0000 (UTC)
Date: Fri, 26 Jan 2018 11:36:07 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20180126093607.m7ka7axrqgg62xvj@platvala-desk.ger.corp.intel.com>
References: <20180116205651.9076-1-antonio.argenziano@intel.com>
 <20180117100618.GQ2759@phenom.ffwll.local>
 <9807c74e-4e50-490e-ff54-347a047bfb7b@intel.com>
 <e898bba4-84ab-897a-c293-e1c0c698ce34@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e898bba4-84ab-897a-c293-e1c0c698ce34@intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v3] tests/gem_reset_stats:
 Fix retrieval of hangcheck stats expectation
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
To: Antonio Argenziano <antonio.argenziano@intel.com>
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBKYW4gMjUsIDIwMTggYXQgMDQ6NTI6NDNQTSAtMDgwMCwgQW50b25pbyBBcmdlbnpp
YW5vIHdyb3RlOgo+IAo+IAo+IE9uIDE3LzAxLzE4IDA5OjQyLCBBbnRvbmlvIEFyZ2Vuemlhbm8g
d3JvdGU6Cj4gPiAKPiA+IAo+ID4gT24gMTcvMDEvMTggMDI6MDYsIERhbmllbCBWZXR0ZXIgd3Jv
dGU6Cj4gPiA+IE9uIFR1ZSwgSmFuIDE2LCAyMDE4IGF0IDEyOjU2OjUxUE0gLTA4MDAsIEFudG9u
aW8gQXJnZW56aWFubyB3cm90ZToKPiA+ID4gPiBUaGUgdGVzdCBleHBlY3RlZCBJT0NUTCAnSTkx
NV9HRVRfUkVTRVRfU1RBVFMnIHdvdWxkIHJldHVybiBhbiBlcnJvcgo+ID4gPiA+IHdoZW4gbm90
IHJvb3QuIFRoYXQgaXMgbm8gbG9uZ2VyIHRydWUgaW4gdGhlIGRyaXZlciBzaW5jZSBjb21taXQK
PiA+ID4gPiA0YzljMGQwOTc0MWQgKCJkcm0vaTkxNTogRml4IHJldHJpZXZhbCBvZiBoYW5nY2hl
Y2sgc3RhdHMiKSBhbmQKPiA+ID4gPiB0aGVyZWZvcmUKPiA+ID4gPiB0aGUgdGVzdCB3YXMgaW5j
b3JyZWN0bHkgZmFpbGluZy4KPiA+ID4gPiAKPiA+ID4gPiB2MjoKPiA+ID4gPiAgICAgLSBBZGQg
dGhlIGNvbW1pdCB0aGF0IGNoYW5nZWQgdGhlIGJlaGF2aW91ciBpbiB0aGUgRHJpdmVyIHRvIHRo
ZQo+ID4gPiA+ICAgICAgIGNvbW1pdCBtZXNzYWdlLiAoTWljaGVsKQo+ID4gPiA+IAo+ID4gPiA+
IHYzOgo+ID4gPiA+ICAgICAtIFJldXNlIGdldF9yZXNldF9jb3VudCBpbnN0ZWFkIG9mIGltcGxl
bWVudGluZyBhIG5ldyBmdW5jdGlvbi4KPiA+ID4gPiAgICAgICAoTWljaGVsKQo+ID4gPiA+IAo+
ID4gPiA+IENjOiBNaWNoZWwgVGhpZXJyeSA8bWljaGVsLnRoaWVycnlAaW50ZWwuY29tPgo+ID4g
PiA+IENjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gPiA+
ID4gQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgo+ID4gPiA+IFNp
Z25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5vQGludGVs
LmNvbT4KPiA+IAo+ID4gVGhpcyByZXZpc2lvbiBvZiB0aGUgcGF0Y2ggaGFzIGFscmVhZHkgYmVl
biByZXZpZXdlZCBvbiBpbnRlbC1nZngsCj4gPiBwYXN0aW5nIFJCIGhlcmUuCj4gPiAKPiA+IFJl
dmlld2VkLWJ5OiBNaWNoZWwgVGhpZXJyeSA8bWljaGVsLnRoaWVycnlAaW50ZWwuY29tPgo+IAo+
IENhbiB3ZSBtZXJnZSB0aGlzPwo+IAoKCk1lcmdlZCBub3csIHRoYW5rcy4KCgotLSAKUGV0cmkg
TGF0dmFsYQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
