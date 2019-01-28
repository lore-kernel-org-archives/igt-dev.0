Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85BD36E6B6
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 16:05:26 +0000 (UTC)
Date: Mon, 28 Jan 2019 17:05:24 +0100
From: Katarzyna Dec <katarzyna.dec@intel.com>
Message-ID: <20190128160524.GA5997@kdec5-desk.ger.corp.intel.com>
References: <20181128225231.29228-1-chris@chris-wilson.co.uk>
 <20181129171648.GN21184@phenom.ffwll.local>
 <20181129171741.GO21184@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181129171741.GO21184@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib: Defer application of
 igt_fixture results
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
To: Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBOb3YgMjksIDIwMTggYXQgMDY6MTc6NDFQTSArMDEwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBUaHUsIE5vdiAyOSwgMjAxOCBhdCAwNjoxNjo0OFBNICswMTAwLCBEYW5pZWwg
VmV0dGVyIHdyb3RlOgo+ID4gT24gV2VkLCBOb3YgMjgsIDIwMTggYXQgMTA6NTI6MzBQTSArMDAw
MCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4gPiBJZiBhbiBpZ3RfZml4dHVyZSBjYXVzZXMgYW4g
aW5kZXBlbmRlbnQgc3ViZ3JvdXAgdG8gZmFpbC9za2lwIGFuZCB0aGF0Cj4gPiA+IHN1Ymdyb3Vw
IGlzIG5vdCBwYXJ0IG9mIHRoZSBleGVjdXRpb24gc2V0ICgtLXJ1bi1zdWJ0ZXN0KSBhcyBubyBz
dWJ0ZXN0cwo+ID4gPiB0aGVtc2VsdmVzIGZhaWxlZCBvciBza2lwcGVkLCBpdCBzaG91bGQgbm90
IGNvdW50IHRvd2FyZHMgdGhlIG92ZXJhbGwKPiA+ID4gdGVzdCBleGl0Y29kZS4KPiA+ID4gCj4g
PiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9p
ZD0xMDg4OTEKPiA+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13
aWxzb24uY28udWs+Cj4gPiAKPiA+IEknbSBob25lc3RseSBhIGJpdCBsb3N0IG9uIHdoYXQncyBn
b2luZyBvbiBoZXJlLiBDb3VsZCB5b3UgcGxlYXNlIHdyaXRlIGEKPiA+IG5ldyBsaWJyYXJ5IHRl
c3RjYXNlIGZvciB0aGlzIG9uZSBoZXJlLCBhcyBkZW1vbnN0cmF0b3I/IEZvciBzdHVmZiBsaWtl
Cj4gPiB0aGlzIEkgcmVhbGx5IHdhbnQgdG8gbG9jayBiZWhhdmlvdXIgZG93biB3aXRoIGNvbXBp
bGUtdGltZSB0ZXN0Y2FzZXMuCj4gCj4gRm9yZ290IHRvIGFkZDogVGhleSdyZSBpbiBsaWIvdGVz
dHMvCj4gLURhbmllbApMb29rcyBsaWtlIHRoaXMgaXNzdWUgaXMgb2JzZXJ2ZWQgd2hlbiBydW5u
aW5nIHNpbmdsZSBzdWJ0ZXN0LCBlLmcuOgogICAgIGdlbV9idXN5IC0tciBidXN5LXJlbmRlcgpD
b2RlIHByZXBhcmVkIGJ5IENocmlzIGRvZXNuJ3QgaGVscCB3aXRoIGFsbCBpc3N1ZXMgSSBhbSBv
YnNlcnZpbmcsIGJ1dCBhdCBsZWFzdApJIHNlZSB0aGUgZGlyZWN0aW9uIHRvIGZvbGxvdy4KSSB3
aWxsIGRlYnVnIHRoZSBpc3N1ZSBtb3JlIGFuZCBsZXQgeW91IGtub3cuCgpLYXNpYSA6KQoKPiAt
LSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
