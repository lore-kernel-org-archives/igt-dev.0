Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 657AE6E868
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Dec 2019 17:46:49 +0000 (UTC)
Date: Tue, 3 Dec 2019 19:46:45 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20191203174645.GV1208@intel.com>
References: <20191201190942.6077-1-zbigniew.kempczynski@intel.com>
 <20191203092529.GG5980@kdec5-desk.ger.corp.intel.com>
 <20191203170558.GA4807@zkempczy-mobl2>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203170558.GA4807@zkempczy-mobl2>
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] lib/intel_bufops: Introduce
 buffer operations
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
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBEZWMgMDMsIDIwMTkgYXQgMDY6MDU6NThQTSArMDEwMCwgWmJpZ25pZXcgS2VtcGN6
ecWEc2tpIHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDAzLCAyMDE5IGF0IDEwOjI1OjI5QU0gKzAxMDAs
IEthdGFyenluYSBEZWMgd3JvdGU6Cj4gCj4gPGN1dD4KPiA+ID4gK3N0YXRpYyB2b2lkICp4X3B0
cih2b2lkICpwdHIsCj4gPiA+ICsJCSAgIHVuc2lnbmVkIGludCB4LCB1bnNpZ25lZCBpbnQgeSwK
PiA+ID4gKwkJICAgdW5zaWduZWQgaW50IHN0cmlkZSwgdW5zaWduZWQgaW50IGNwcCkKPiA+ID4g
K3sKPiA+ID4gKwljb25zdCBpbnQgdGlsZV93aWR0aCA9IDUxMjsKPiA+ID4gKwljb25zdCBpbnQg
dGlsZV9oZWlnaHQgPSA4Owo+ID4gSXQgY2FuIGJlIHJlYWxseSBzaWxseSBxdWVzdGlvbiAtIGFy
ZSB0aGVzZSBeIHZhbHVlcyBhbHdheXMgdGhlIHNhbWU/Cj4gCj4gWWVzLgoKSWYgeW91IGlnbm9y
ZSBnZW4yLgoKPiAKPiA+ID4gKwljb25zdCBpbnQgdGlsZV9zaXplID0gdGlsZV93aWR0aCAqIHRp
bGVfaGVpZ2h0Owo+ID4gPiArCWludCB0aWxlX3gsIHRpbGVfeTsKPiA+ID4gKwlpbnQgb2Zmc2V0
X3gsIG9mZnNldF95LCBwb3M7Cj4gPiA+ICsKPiA+ID4gKwl4ICo9IGNwcDsKPiA+ID4gKwl0aWxl
X3ggPSB4IC8gdGlsZV93aWR0aDsKPiA+ID4gKwl0aWxlX3kgPSB5IC8gdGlsZV9oZWlnaHQ7Cj4g
PiA+ICsJb2Zmc2V0X3ggPSAodGlsZV94ICogdGlsZV9zaXplKTsKPiA+ID4gKwlvZmZzZXRfeSA9
ICh0aWxlX3kgKiBzdHJpZGUgKiB0aWxlX2hlaWdodCk7Cj4gPiA+ICsKPiA+ID4gKwlwb3MgPSBv
ZmZzZXRfeSArIG9mZnNldF94ICsKPiA+ID4gKwkJCSh5ICUgdGlsZV9oZWlnaHQgKiB0aWxlX3dp
ZHRoKSArICh4ICUgdGlsZV93aWR0aCk7Cj4gPiA+ICsKPiA+ID4gKwlyZXR1cm4gcHRyICsgcG9z
Owo+ID4gPiArfQo+ID4gPiArCj4gPiA+ICtzdGF0aWMgdm9pZCAqeV9wdHIodm9pZCAqcHRyLAo+
ID4gPiArCQkgICB1bnNpZ25lZCBpbnQgeCwgdW5zaWduZWQgaW50IHksCj4gPiA+ICsJCSAgIHVu
c2lnbmVkIGludCBzdHJpZGUsIHVuc2lnbmVkIGludCBjcHApCj4gPiA+ICt7Cj4gPiA+ICsJY29u
c3QgaW50IHRpbGVfd2lkdGggPSAxMjg7Cj4gPiA+ICsJY29uc3QgaW50IHRpbGVfaGVpZ2h0ID0g
MzI7Cj4gPiA+ICsJY29uc3QgaW50IG93b3JkcyA9IDE2Owo+ID4gU2ltaWxhciBxdWVzdGlvbi4g
SSBndWVzcyB0aGlzIGlzIHNvbWV0aGluZyBzcGVjaWZpYyBlaXRoZXIgdG8gSW50ZWwgR2VuIG9y
IHRvCj4gPiB0ZXN0Y2FzZXMuCj4gCj4gVGlsZS1uIHdoZXJlIG4gaXMgWC9ZL1lmL1lzLy4uLiBk
ZXNjcmliZSBkYXRhIHBsYWNlbWVudCBhbGdvcml0aG1zCj4gdG8gYmUgQ1BVL0dQVSBjYWNoZS1m
cmllbmRseS4gCgpUaGVzZSBudW1iZXJzIGFsc28gb25seSB3b3JrIGZvciBpOTQ1Ky4KCi0tIApW
aWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2
