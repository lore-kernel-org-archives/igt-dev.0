Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAF96E3A2
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 14:19:52 +0000 (UTC)
Received: by mail-qt1-x843.google.com with SMTP id q41-v6so30146502qtq.10
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Oct 2018 07:19:52 -0700 (PDT)
MIME-Version: 1.0
References: <1539767601-16519-1-git-send-email-jyoti.r.yadav@intel.com>
 <153976946056.22931.1730804888828078397@skylake-alporthouse-com>
In-Reply-To: <153976946056.22931.1730804888828078397@skylake-alporthouse-com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Wed, 17 Oct 2018 16:19:39 +0200
Message-ID: <CAKMK7uFmv421JWowq1udGgjJYrM1NBty2rtVxRp7p_Jb2ZzYrg@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] [CI] tests/pm_backlight.c: Fix
 brightness failure with system suspend
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
Cc: Yadav Jyoti <jyoti.r.yadav@intel.com>, IGT development <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBPY3QgMTcsIDIwMTggYXQgMTE6NDQgQU0gQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+IHdyb3RlOgo+Cj4gUXVvdGluZyBKeW90aSBZYWRhdiAoMjAxOC0xMC0x
NyAxMDoxMzoyMCkKPiA+IFRoaXMgcGF0Y2ggdHJpZXMgdG8gZml4IHRoZSBmYWxpdXJlIG9jY3Vy
aW5nIGR1cmluZyBzdWJ0ZXN0Cj4gPiAiZmFkZV93aXRoX3N1c3BlbmQiLiBGYWlsdXJlIGlzIG9j
Y3VyaW5nIGJlY2F1c2UsIGJyaWdodG5lc3MKPiA+IHZhbHVlIGlzIGJlaW5nIGNoZWNrZWQgYmVm
b3JlIGRyaXZlciBpbml0aWFsaXplcyBmdWxseSBhZnRlciByZXN1bWUuCj4gPgo+ID4gQnVnemls
bGE6IGh0dHBzOi8vYnVncy5mcmVlZGVza3RvcC5vcmcvc2hvd19idWcuY2dpP2lkPTEwNzg0Nwo+
ID4gU2lnbmVkLW9mZi1ieTogSnlvdGkgWWFkYXYgPGp5b3RpLnIueWFkYXZAaW50ZWwuY29tPgo+
ID4gLS0tCj4gPiAgdGVzdHMvcG1fYmFja2xpZ2h0LmMgfCAxICsKPiA+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fYmFja2xpZ2h0
LmMgYi90ZXN0cy9wbV9iYWNrbGlnaHQuYwo+ID4gaW5kZXggMzI4MDhjZC4uZWMwNDdiMyAxMDA2
NDQKPiA+IC0tLSBhL3Rlc3RzL3BtX2JhY2tsaWdodC5jCj4gPiArKysgYi90ZXN0cy9wbV9iYWNr
bGlnaHQuYwo+ID4gQEAgLTE4Myw2ICsxODMsNyBAQCB0ZXN0X2ZhZGVfd2l0aF9zdXNwZW5kKHN0
cnVjdCBjb250ZXh0ICpjb250ZXh0LCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCkKPiA+ICAgICAgICAg
aWd0X3JlcXVpcmUoaWd0X3dhaXRfZm9yX3BtX3N0YXR1cyhJR1RfUlVOVElNRV9QTV9TVEFUVVNf
U1VTUEVOREVEKSk7Cj4gPgo+ID4gICAgICAgICBpZ3Rfc3lzdGVtX3N1c3BlbmRfYXV0b3Jlc3Vt
ZShTVVNQRU5EX1NUQVRFX01FTSwgU1VTUEVORF9URVNUX05PTkUpOwo+ID4gKyAgICAgICBpZ3Rf
cmVxdWlyZShpZ3Rfd2FpdF9mb3JfcG1fc3RhdHVzKElHVF9SVU5USU1FX1BNX1NUQVRVU19BQ1RJ
VkUpKTsKPgo+IFdoeSB3b3VsZCB0aGUgZGV2aWNlIGJlIGFjdGl2ZSBvbiBzeXN0ZW0gcmVzdW1l
IGlmIGl0IHdhcyBhc2xlZXAKPiBiZWZvcmVoYW5kPyBJbiBmYWN0LCB0aGF0IHNvdW5kcyBsaWtl
IHRoZSBvcHBvc2l0ZSBvZiB3aGF0IHdlIHdvdWxkIGxpa2UKPiA7KQoKVGhpcyBhbHNvIGxvb2tz
IGxpa2UgcGFwZXJpbmcgb3ZlciBhIGtlcm5lbCBidWcgSSB0aGluay4gT3IgYSB0ZXN0CmJ1Zy4g
RG9pbmcgYW4gaWd0X3JlcXVpcmUgYWZ0ZXIgd2UndmUgZG9uZSBhIHJhdGhlciBleHBlbnNpdmUK
b3BlcmF0aW9uIGFscmVhZHkgKHN1c3BlbmQvcmVzdW1lIGN5Y2xlKSBpcyBkZWZpbml0ZWx5IG5v
dCBjb3JyZWN0IC0Kd2Ugc2hvdWxkIGtub3cgd2hhdCBzaG91bGQgd29yaywgbm90IGR5bmFtaWNh
bGx5IHNraXAgdGhlIHRlc3QgaWYgaXQKdHVybnMgb3V0IGl0IGRpZG4ndCB3b3JrLgotRGFuaWVs
Ci0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgor
NDEgKDApIDc5IDM2NSA1NyA0OCAtIGh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0Cmln
dC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
