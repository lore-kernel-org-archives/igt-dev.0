Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3969B88A58
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 05:34:28 +0000 (UTC)
Date: Mon, 14 Jun 2021 07:34:22 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210614053422.GA3302@zkempczy-mobl2>
References: <20210609043035.102359-1-jason@jlekstrand.net>
 <20210609043035.102359-19-jason@jlekstrand.net>
 <20210609071839.GK6228@zkempczy-mobl2>
 <CAOFGe95pMGM5k60wEEkqJz1u3Vq8NgrjxyDHwv91+7ffHbT1GA@mail.gmail.com>
 <87tum4m6qh.wl-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87tum4m6qh.wl-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 18/93] tests/i915/gem_exec_fence: Move
 the engine data into inter_engine_context
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
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTEsIDIwMjEgYXQgMDI6Mjg6MDZQTSAtMDcwMCwgRGl4aXQsIEFzaHV0b3No
IHdyb3RlOgo+IE9uIFdlZCwgMDkgSnVuIDIwMjEgMDg6MDI6MDQgLTA3MDAsIEphc29uIEVrc3Ry
YW5kIHdyb3RlOgo+ID4gT24gV2VkLCBKdW4gOSwgMjAyMSBhdCAyOjE4IEFNIFpiaWduaWV3IEtl
bXBjennFhHNraQo+ID4gPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4gd3JvdGU6Cj4g
PiA+IE9uIFR1ZSwgSnVuIDA4LCAyMDIxIGF0IDExOjMwOjA0UE0gLTA1MDAsIEphc29uIEVrc3Ry
YW5kIHdyb3RlOgo+ID4gPiA+IC1zdGF0aWMgdm9pZCBzZXR1cF90aW1lbGluZV9jaGFpbl9lbmdp
bmVzKHN0cnVjdCBpbnRlcl9lbmdpbmVfY29udGV4dCAqY29udGV4dCwgaW50IGZkLCBzdHJ1Y3Qg
aW50ZWxfZW5naW5lX2RhdGEgKmVuZ2luZXMpCj4gPiA+ID4gK3N0YXRpYyB2b2lkIHNldHVwX3Rp
bWVsaW5lX2NoYWluX2VuZ2luZXMoc3RydWN0IGludGVyX2VuZ2luZV9jb250ZXh0ICpjb250ZXh0
LCBpbnQgZmQpCj4gPiA+ID4gIHsKPiA+ID4gPiAgICAgICBtZW1zZXQoY29udGV4dCwgMCwgc2l6
ZW9mKCpjb250ZXh0KSk7Cj4gPiA+ID4KPiA+ID4gPiAgICAgICBjb250ZXh0LT5mZCA9IGZkOwo+
ID4gPiA+IC0gICAgIGNvbnRleHQtPmVuZ2luZXMgPSBlbmdpbmVzOwo+ID4gPiA+ICsgICAgIGNv
bnRleHQtPmVuZ2luZXMgPSBpbnRlbF9pbml0X2VuZ2luZV9saXN0KGZkLCAwKTsKPiA+ID4KPiA+
ID4gT3JpZ2luYWwgY29kZSB2ZXJpZmllcyB0aGVyZSdzIG5lbmdpbmVzID4gMC4gSSB3b3VsZCBr
ZWVwIHRoaXMgaWd0X3JlcXVpcmUoKS4KPiA+Cj4gPiBJJ20gbm90IHNlZWluZyB0aGF0IGluIHRo
ZSBkaWZmIG9yIHRoZSBjb2RlLiAgTWluZCBwb2ludGluZyBtZSBhdCBpdD8KPiA+IEluIGFueSBj
YXNlLCBJJ20gZmluZSB3aXRoIHRoZSBpZ3RfcmVxdWlyZSgpOyBpdCBzaG91bGQgYWx3YXlzIGJl
IHRydWUKPiA+IGFueXdheS4KPiAKPiBOb3RlIHRoYXQgb3JpZ2luYWwgY29kZSBoYXMgImlndF9y
ZXF1aXJlKGVuZ2luZXMubmVuZ2luZXMgPiAxKSIgbm90ID4KPiAwLiBTdGlsbCBhbHdheXMgdHJ1
ZSBidXQgcHJvYmFibHkgdGhlcmUganVzdCB0byBzaG93IHRoZSBpbnRlbnQgb2YgdGhlCj4gdGVz
dC4KClllcywgSSBtZWFuIGlndF9yZXF1aXJlKGVuZ2luZXMubmVuZ2luZXMgPiAxKS4KCklzc3Vl
IGNvbWVzIGJlY2F1c2UgSSdtIHVzaW5nIHNpZGUtYnktc2lkZSBjb2RlIGNvbXBhcmUgc28gSSBj
b21wYXJlZAphbGwgY29tbWl0cyBhcHBsaWVkIHRvIGdlbV9leGVjX2ZlbmNlLmMuIElmIHRoZXJl
J3Mgbm8gb3B0aW9uIHRvIGhhdmUKbGVzcyB0aGFuIHR3byBlbmdpbmVzIHdlIGNvdWxkIGp1c3Qg
cmVtb3ZlIHRoYXQgY2hlY2suCgotLQpaYmlnbmlldyAKIAo+ID4KPiA+ID4gV2l0aCB0aGF0IG1p
bm9yIG5pdDoKPiA+ID4KPiA+ID4gUmV2aWV3ZWQtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8
emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgo+ID4KPiA+IFRoYW5rcyEKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
