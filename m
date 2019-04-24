Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101E5890EB
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 08:28:08 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id a6so15143714edv.1
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 01:28:07 -0700 (PDT)
Date: Wed, 24 Apr 2019 10:28:02 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190424082802.GL9857@phenom.ffwll.local>
References: <20190404113300.10527-1-daniel.vetter@ffwll.ch>
 <155437815174.18991.2962940166230769549@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <155437815174.18991.2962940166230769549@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_flip: Improve asserts for
 expired vblank tests
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
Cc: IGT development <igt-dev@lists.freedesktop.org>, "Peres,
 Martin" <martin.peres@intel.com>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBBcHIgMDQsIDIwMTkgYXQgMTI6NDI6MzFQTSArMDEwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgRGFuaWVsIFZldHRlciAoMjAxOS0wNC0wNCAxMjozMzowMCkKPiA+IFN0
ZXAgMSBpbiBkZWJ1Z2dpbmc6IEFjdHVhbGx5IHVuZGVyc3RhbmQgd2hhdCdzIGdvaW5nIHdyb25n
Lgo+ID4gCj4gPiBSZWZlcmVuY2VzOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3df
YnVnLmNnaT9pZD0xMDI4ODcKPiA+IENjOiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxl
ckBpbnRlbC5jb20+Cj4gPiBDYzogIlBlcmVzLCBNYXJ0aW4iIDxtYXJ0aW4ucGVyZXNAaW50ZWwu
Y29tPgo+ID4gU2lnbmVkLW9mZi1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRl
bC5jb20+Cj4gUmV2aWV3ZWQtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNv
LnVrPgoKVGhhbmtzIGZvciB5b3VyIHJldmlldywgcGF0Y2ggcHVzaGVkLgotRGFuaWVsCi0tIApE
YW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8v
YmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
