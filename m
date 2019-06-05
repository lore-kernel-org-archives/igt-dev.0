Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97C5189935
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 12:32:27 +0000 (UTC)
Date: Wed, 5 Jun 2019 15:32:25 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190605123225.GH22949@platvala-desk.ger.corp.intel.com>
References: <20190604084612.13950-1-petri.latvala@intel.com>
 <0e81bb65-c04c-749d-dd64-9bfdd71a9c5e@linux.intel.com>
 <20190605090832.GB22949@platvala-desk.ger.corp.intel.com>
 <bf72e9ea-4a16-bdc2-22c9-b2c582548277@linux.intel.com>
 <20190605112750.GA2690@intel.intel>
 <20190605120348.GG22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605120348.GG22949@platvala-desk.ger.corp.intel.com>
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
To: Andi Shyti <andi.shyti@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDM6MDM6NDhQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwMjoyNzo1MFBNICswMzAwLCBBbmRpIFNo
eXRpIHdyb3RlOgo+ID4gSGksCj4gPiAKPiA+ID4gPiA+ID4gICAgCQlpZ3Rfc3VidGVzdF9ncm91
cCB7Cj4gPiA+ID4gPiA+ICAgIAkJCWlndF9maXh0dXJlIHsKPiA+ID4gPiA+ID4gLQkJCQlnZW1f
Y29udGV4dF9oYXNfZW5naW5lKGZkLCAwLCBlLT5mbGFncyk7Cj4gPiA+ID4gPiA+ICsJCQkJaWd0
X3JlcXVpcmUoZ2VtX2NvbnRleHRfaGFzX2VuZ2luZShmZCwgMCwgZS0+ZmxhZ3MpKTsKPiA+ID4g
PiA+IAo+ID4gPiA+ID4gSG1tbS4uIGlzIHRoZSBsaW5lIGV2ZW4gbmVlZGVkPyBJIHRoaW5rIGl0
ZXJhdG9yIHdpbGwgb25seSBjb250YWluIGF2YWlsYWJsZQo+ID4gPiA+ID4gZW5naW5lcy4KPiA+
ID4gPiAKPiA+ID4gPiAKPiA+ID4gPiBHb29kIHF1ZXN0aW9uLCBsb29rcyBsaWtlIG5vLgo+ID4g
PiA+IAo+ID4gPiA+IERvZXMgdGhlIGl0ZXJhdG9yIG9ubHkgZ2l2ZSBhdmFpbGFibGUgZW5naW5l
cyBvbiB5ZSBvbGRlIGtlcm5lbHMgdG9vPwo+ID4gPiAKPiA+ID4gVGhlcmUgaXMgYSBnZW1faGFz
X3JpbmcgaW4gZ2VtX2VuZ2luZV90b3BvbG9neS5jL2ludGVsX2luaXRfZW5naW5lX2xpc3Qgb24K
PiA+ID4gdGhlIGxlZ2FjeSBwYXRoIHNvIEkgdGhpbmsgaXQgZmlsdGVycyB0aGVtIHRoZXJlIGFz
IHdlbGwuCj4gPiA+IAo+ID4gPiBBbmRpPwo+ID4gCj4gPiB5ZXMsIGluZGVlZCwgd2hhdCBleGFj
dGx5IGlzIHRoZSBpc3N1ZT8KPiAKPiBXaGV0aGVyIGdlbV9jb250ZXh0X2hhc19lbmdpbmUgY2hl
Y2sgaXMgbmVlZGVkIGluc2lkZSB0aGUKPiBfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZSBsb29w
LCBmb3IgYW55IGtlcm5lbC4KCgpBbmRpIGNvbmZpcm1lZCBoZXJlIHRoYXQgaW5kZWVkLCBmb3Ig
YW55IGtlcm5lbCwgZXRjLgoKCi0tIApQZXRyaSBMYXR2YWxhCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
