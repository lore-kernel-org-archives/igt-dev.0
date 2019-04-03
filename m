Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CC316E810
 for <igt-dev@lists.freedesktop.org>; Wed,  3 Apr 2019 13:57:19 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id x61so14979779edc.9
 for <igt-dev@lists.freedesktop.org>; Wed, 03 Apr 2019 06:57:19 -0700 (PDT)
Date: Wed, 3 Apr 2019 15:57:14 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190403135714.GJ2665@phenom.ffwll.local>
References: <20190403135042.24195-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190403135042.24195-1-daniel.vetter@ffwll.ch>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: Use igt_require more
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMDMsIDIwMTkgYXQgMDM6NTA6NDJQTSArMDIwMCwgRGFuaWVsIFZldHRlciB3
cm90ZToKPiBTdWNjZXNzIGlzIG5vdCB0aGUgcmlnaHQgc3RhdHVzIGlmIHRoZSB0ZXN0IGRvZXMg
bm90aGluZy4gRml4IHRoYXQuCj4gCj4gQ2M6IExpb25lbCBMYW5kd2VybGluIDxsaW9uZWwuZy5s
YW5kd2VybGluQGludGVsLmNvbT4KPiBDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGls
ZXJAaW50ZWwuY29tPgo+IENjOiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RA
bGludXguaW50ZWwuY29tPgo+IENjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwuY29t
Pgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAaW50ZWwuY29t
PgoKUGxlYXNlIGRpc3JlZ2FyZCwgVmlsbGUgaGFzIGEgcGF0Y2ggY292ZXJpbmcgdGhpcyBvbmUg
YWxyZWFkeS4KLURhbmllbAoKPiAtLS0KPiAgdGVzdHMva21zX2NvbG9yLmMgfCAzICstLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ttc19jb2xvci5jIGIvdGVzdHMva21zX2NvbG9yLmMKPiBpbmRleCBkZWNm
M2MyYTY4MGUuLmQyMzUyY2Y4YTliYSAxMDA2NDQKPiAtLS0gYS90ZXN0cy9rbXNfY29sb3IuYwo+
ICsrKyBiL3Rlc3RzL2ttc19jb2xvci5jCj4gQEAgLTExMzUsOCArMTEzNSw3IEBAIGludmFsaWRf
Y3RtX21hdHJpeF9zaXplcyhkYXRhX3QgKmRhdGEpCj4gIAlpZ3RfcGlwZV90ICpwaXBlID0gJmRp
c3BsYXktPnBpcGVzWzBdOwo+ICAJdm9pZCAqcHRyOwo+ICAKPiAtCWlmICghaWd0X3BpcGVfb2Jq
X2hhc19wcm9wKHBpcGUsIElHVF9DUlRDX0NUTSkpCj4gLQkJcmV0dXJuOwo+ICsJaWd0X3JlcXVp
cmUoaWd0X3BpcGVfb2JqX2hhc19wcm9wKHBpcGUsIElHVF9DUlRDX0NUTSkpOwo+ICAKPiAgCXB0
ciA9IG1hbGxvYyhzaXplb2Yoc3RydWN0IF9kcm1fY29sb3JfY3RtKSAqIDQpOwo+ICAKPiAtLSAK
PiAyLjIwLjEKPiAKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
