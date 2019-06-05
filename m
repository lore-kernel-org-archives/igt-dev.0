Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7825189D87
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 16:54:17 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id m10so6729544edv.6
 for <igt-dev@lists.freedesktop.org>; Wed, 05 Jun 2019 09:54:17 -0700 (PDT)
Date: Wed, 5 Jun 2019 18:54:11 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190605165411.GY21222@phenom.ffwll.local>
References: <20190605121607.28014-1-petri.latvala@intel.com>
 <20190605123656.GT21222@phenom.ffwll.local>
 <20190605125354.GI22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605125354.GI22949@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] runner: Also consider
 TAINT_MACHINE_CHECK as abortable taint
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
To: Daniel Vetter <daniel@ffwll.ch>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDM6NTM6NTRQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBXZWQsIEp1biAwNSwgMjAxOSBhdCAwMjozNjo1NlBNICswMjAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDM6MTY6MDdQTSArMDMw
MCwgUGV0cmkgTGF0dmFsYSB3cm90ZToKPiA+ID4gU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFs
YSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Cj4gPiA+IENjOiBNaWthIEt1b3BwYWxhIDxtaWth
Lmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+IAo+ID4gSSd2ZSBzZWVuIGxvdHMgb2YgbWFj
aGluZXMgd2hlcmUgdGhlc2UgaGFwcGVuIGFzIG5vcm1hbCBzaWRlLWVmZmVjdCBvZgo+ID4gdGhl
cm1hbCB0aHJvdGxsaW5nLiBGb3Igc29tZSB2YWx1ZSBvZiAibm9ybWFsIi4KPiA+IAo+ID4gRG8g
d2UgcmVhbGx5IHdhbnQgdG8gcmVib290IG9uIHRoZXNlPyBJdCBjb3VsZCBiZSBsaWtlIHRoZSBu
ZXR3b3JrIHRoaW5nIEkKPiA+IHJlY2VudGx5IGRpc2FibGVkLCBhbmQgdGhlbiBldmVyeW9uZSBz
dGFydGVkIHNjcmVhbWluZyBiZWNhdXNlIG91cgo+ID4gbWFjaGluZXMgd2hlcmUgY29uc3RhbnRs
eSByZWJvb3RpbmcgZHVlIHRvIG5ldHdvcmsgY2FyZHMvZHJpdmVycwo+ID4gdGVtcG9yYXJpbHkg
aGF2aW5nIGEgYmFkIHRpbWUgKGJ1dCB1c3VhbGx5IHJlY292ZXJpbmcpLgo+IAo+IAo+IEkndmUg
c2VlbiBzb21lIE1DRSBsb2cgbWVzc2FnZXMgb24gZG1lc2dzLCBxdWl0ZSBvZnRlbiBvbiBvbmUg
b2YgdGhlCj4gQlhUcyBmb3IgZXhhbXBsZS4gSG93IG9mdGVuIHRob3NlIE1DRSB0cmlnZ2VycyBj
YXVzZWQgdGFpbnQgaXMgYW5vdGhlcgo+IHF1ZXN0aW9uLgo+IAo+IFJlYWRpbmcgdGhlIG1jZSBj
b2RlLCBpdCBzZWVtcyB0byBiZSB0aGVybWFsIF9mYWlsdXJlXyB0aGF0IGNhdXNlcyBhCj4gdGFp
bnQuIEFuZCBhbGwgb2YgdGhlc2UgYWRkX3RhaW50KCkgY2FsbHMgYWxzbyB1c2UKPiBMT0NLREVQ
X05PV19VTlJFTElBQkxFIHNvIHdlJ3JlIGFscmVhZHkgZGVlcCB1bmRlciB0aGUgYnVzIGlmIHdl
IGdldAo+IHRoYXQgdGFpbnQuCgpIbSBvayBpZiBsb2NrZGVwIGlzIGdvbmUgdGhlbiB3ZSByZWJv
b3QgYW55d2F5LiBJIGd1ZXNzIGFjayBmcm9tIG1lIHRoZW4uCgpTaW5jZSB0aGUgZ29hbCBpcyB0
byB0aHJvdyB0aGVzZSBtYWNoaW5lcyBvdXQsIHNob3VsZG4ndCB3ZSBoYXZlIGEgc3BlY2lhbApl
cnJvciBmb3IgdGhlc2U/IEluc3RlYWQgb2YganVzdCBhYm9ydGVkIEkgbWVhbi4KLURhbmllbAot
LSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0
cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
