Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E13C89256
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 07:37:06 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id c1so12307460edk.5
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Apr 2019 00:37:06 -0700 (PDT)
Date: Thu, 25 Apr 2019 09:36:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190425073658.GC9857@phenom.ffwll.local>
References: <20190424161526.19208-1-simon.ser@intel.com>
 <20190425073525.GA9857@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190425073525.GA9857@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t] ci: build with Clang
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
To: Simon Ser <simon.ser@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgMjUsIDIwMTkgYXQgMDk6MzU6MjVBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBXZWQsIEFwciAyNCwgMjAxOSBhdCAwNzoxNToyNlBNICswMzAwLCBTaW1vbiBT
ZXIgd3JvdGU6Cj4gPiBUaGlzIGFkZHMgYSBidWlsZCBzdGVwIHdpdGggQ2xhbmcgb24gRmVkb3Jh
LiBIb3BlZnVsbHkgdGhpcyBjYW4gaGVscCBrZWVwaW5nCj4gPiBDbGFuZyBidWlsZHMgaGVhbHRo
eS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29t
Pgo+ID4gLS0tCj4gPiAgLmdpdGxhYi1jaS55bWwgfCA4ICsrKysrKysrCj4gPiAgMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvLmdpdGxhYi1jaS55
bWwgYi8uZ2l0bGFiLWNpLnltbAo+ID4gaW5kZXggYWU4Y2JiNjcuLmU3ZDMxMzc2IDEwMDY0NAo+
ID4gLS0tIGEvLmdpdGxhYi1jaS55bWwKPiA+ICsrKyBiLy5naXRsYWItY2kueW1sCj4gPiBAQCAt
NDcsNiArNDcsMTQgQEAgYnVpbGQ6dGVzdHMtZmVkb3JhLW9sZGVzdC1tZXNvbjoKPiA+ICAgICAg
LSBuaW5qYSAtQyBidWlsZAo+ID4gICAgICAtIG5pbmphIC1DIGJ1aWxkIGlndC1ncHUtdG9vbHMt
ZG9jCj4gPiAgCj4gPiArYnVpbGQ6dGVzdHMtZmVkb3JhLWNsYW5nOgo+ID4gKyAgc3RhZ2U6IGJ1
aWxkCj4gPiArICBzY3JpcHQ6Cj4gPiArICAgIC0gZG5mIGluc3RhbGwgLXkgY2xhbmcKPiA+ICsg
ICAgLSBleHBvcnQgQ0M9Y2xhbmcKPiA+ICsgICAgLSBtZXNvbiAkTUVTT05fT1BUSU9OUyBidWls
ZAo+ID4gKyAgICAtIG5pbmphIC1DIGJ1aWxkCj4gCj4gVWggd2h5Pwo+IAo+IFRoZSB0aGluZyB0
aGF0IGJyb2tlbiBpcyBidWlsZGluZyBvbiBub24teDg2IGhvc3RzLCBhbmQgdGhhdCdzIHRoZSB0
aGluZwo+IGdpdGxhYiBDSSBjYXVnaHQuIEkgaGF2ZSBubyBpZGVhIHdoeSB0aGlzIGlzIGFsbCBh
Ym91dCBjbGFuZyAoaW1vIGl0J3MKPiBub3QpLCBhbmQgSSBkb24ndCB0aGluayB3ZSBzaG91bGQg
Y2FyZSBhYm91dCBjbGFuZyBlaXRoZXIuCj4gLURhbmllbAo+IAo+ID4gKwo+ID4gIGJ1aWxkOnRl
c3RzLWRlYmlhbi1tZXNvbjoKPiA+ICAgIGltYWdlOiAkQ0lfUkVHSVNUUlkvJENJX1BST0pFQ1Rf
UEFUSC9pZ3QtZGViaWFuOmxhdGVzdAo+ID4gICAgc3RhZ2U6IGJ1aWxkCj4gPiAtLSAKPiA+IDIu
MjEuMAo+ID4gCj4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gaWd0LWRldiBtYWlsaW5nIGxpc3QKPiA+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYKPiAKPiAtLSAKPiBEYW5pZWwgVmV0dGVyCj4gU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCj4gaHR0cDovL2Jsb2cuZmZ3bGwuY2gKCi0tIApEYW5pZWwgVmV0dGVy
ClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5j
aApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
