Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477DE6E08F
 for <igt-dev@lists.freedesktop.org>; Mon,  1 Apr 2019 07:30:43 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d1so7210710edd.13
 for <igt-dev@lists.freedesktop.org>; Mon, 01 Apr 2019 00:30:43 -0700 (PDT)
Date: Mon, 1 Apr 2019 09:30:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190401073039.GV2665@phenom.ffwll.local>
References: <20190329112901.27830-1-stanislav.lisovskiy@intel.com>
 <20190329112901.27830-4-stanislav.lisovskiy@intel.com>
 <20190401072847.GU2665@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190401072847.GU2665@phenom.ffwll.local>
Subject: Re: [igt-dev] [PATCH i-g-t v1 3/3] igt/tests: Tolerate if kernel
 can't have all planes
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
To: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Cc: ville.syrjala@intel.com, martin.peres@intel.com, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDk6Mjg6NDdBTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBPbiBGcmksIE1hciAyOSwgMjAxOSBhdCAwMToyOTowMVBNICswMjAwLCBTdGFuaXNs
YXYgTGlzb3Zza2l5IHdyb3RlOgo+ID4gV2l0aCBzb21lIHVwY29taW5nIGNoYW5nZXMgaTkxNSBt
aWdodCBub3QgYWxsb3cKPiA+IGFsbCBzcHJpdGUgcGxhbmVzIGVuYWJsZWQsIGRlcGVuZGluZyBv
biBhdmFpbGFibGUKPiA+IGJhbmR3aWR0aCBsaW1pdGF0aW9uLiBUaHVzIHRoZSB0ZXN0IG5lZWQg
dG8gZGVjcmVtZW50Cj4gPiBhbW91bnQgb2YgcGxhbmVzIGFuZCB0cnkgYWdhaW4sIGluc3RlYWQg
b2YgcGFuaWNraW5nLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlzb3Zza2l5
IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KPiAKPiBJJ20gbG9va2luZyBhdCBhIHNp
bWlsYXIgcHJvYmxlbSBpbiBrbXNfY29uY3VycmVudCwgYW5kIEkgdGhpbmsgd2Ugbm93Cj4gYWxz
byBuZWVkIHRvIHJhbmRvbWl6ZSB0aGUgcGxhbmVzIHdlIHBpY2suIFdpdGggYncgbGltaXRzIChh
bmQgb3RoZXIgc3R1ZmYKPiByZWFsbHksIHRoaXMgaXMganVzdCB0aGUgb25lIHdlJ3JlIGhpdHRp
bmcgbm93KSB3ZSdkIG90aGVyd2lzZSBoYXZlIGEgZ29vZAo+IGNoYW5jZSBvZiBub3QgdGVzdGlu
ZyB0aGUgbGFzdCBmZXcgcGxhbmVzLiBCeSByYW5kb21pemluZyB3aGljaCBwbGFuZXMKPiB3ZSdy
ZSBwaWNraW5nIHdlIHNob3VsZCBiZSBhYmxlIHRvIG1ha2UgdGhpbmdzIGEgbG90IG1vcmUgaW50
ZXJlc3RpbmcgZm9yCj4gdGhlIGtlcm5lbC4KCmlndF9wZXJtdXRlX2FycmF5IChmb3IgYW4gYXJy
YXkgb2YgcGxhbmUgaW5kaWNlcyBwcm9iYWJseSkgc2hvdWxkIGhlbHAKd2l0aCB0aGF0LgotRGFu
aWVsCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlv
bgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
