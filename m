Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x229.google.com (mail-wr0-x229.google.com
 [IPv6:2a00:1450:400c:c0c::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A641B6E3BD
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2018 12:17:22 +0000 (UTC)
Received: by mail-wr0-x229.google.com with SMTP id m5so13768452wrg.1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 Feb 2018 04:17:22 -0800 (PST)
Date: Tue, 20 Feb 2018 13:17:18 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20180220121718.GQ22199@phenom.ffwll.local>
References: <20180211185433.22500-1-chris@chris-wilson.co.uk>
 <151868650767.15373.14591219774933240864@mail.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <151868650767.15373.14591219774933240864@mail.alporthouse.com>
Subject: Re: [igt-dev] [PATCH igt] igt/kms_frontbuffer_tracking: Disable FBC
 testing for -ENODEV
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBGZWIgMTUsIDIwMTggYXQgMDk6MjE6NDdBTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQ2hyaXMgV2lsc29uICgyMDE4LTAyLTExIDE4OjU0OjMzKQo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Cj4gCj4g
UG9rZSwgQ0kgaXMgc3RpbGwgdHJpcHBpbmcgb3ZlciB0aGlzLi4uCgpDYW4geW91IGdpdmUgYSBi
aXQgbW9yZSBjb250ZXh0IGFib3V0IHdoYXQncyBnb2luZyBvbiBhbmQgaG93IHRoaXMKaGFwcGVu
cz8gQnVnemlsbGEgb3Igd2hhdGV2ZXIgLi4uIEknbSBjb25mdXNlZC4KLURhbmllbAoKPiAKPiA+
IC0tLQo+ID4gIHRlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgMyArKysKPiA+ICAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS90ZXN0
cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jCj4gPiBpbmRleCA2MDI3MDdmOTguLjZkM2ZlOGQwMiAxMDA2NDQKPiA+IC0tLSBhL3Rl
c3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCj4gPiArKysgYi90ZXN0cy9rbXNfZnJvbnRi
dWZmZXJfdHJhY2tpbmcuYwo+ID4gQEAgLTE1ODgsNiArMTU4OCw5IEBAIHN0YXRpYyBib29sIGZi
Y19zdXBwb3J0ZWRfb25fY2hpcHNldCh2b2lkKQo+ID4gICAgICAgICBjaGFyIGJ1ZlsxMjhdOwo+
ID4gIAo+ID4gICAgICAgICBkZWJ1Z2ZzX3JlYWQoImk5MTVfZmJjX3N0YXR1cyIsIGJ1Zik7Cj4g
PiArICAgICAgIGlmICgqYnVmID09ICdcMCcpCj4gPiArICAgICAgICAgICAgICAgcmV0dXJuIGZh
bHNlOwo+ID4gKwo+ID4gICAgICAgICByZXR1cm4gIXN0cnN0cihidWYsICJGQkMgdW5zdXBwb3J0
ZWQgb24gdGhpcyBjaGlwc2V0XG4iKTsKPiA+ICB9Cj4gPiAgCj4gPiAtLSAKPiA+IDIuMTYuMQo+
ID4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBp
Z3QtZGV2IG1haWxpbmcgbGlzdAo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2CgotLSAK
RGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDov
L2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
