Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37B956E154
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2019 15:37:06 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id w13so27794451eds.4
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Jun 2019 08:37:06 -0700 (PDT)
Date: Tue, 25 Jun 2019 17:37:01 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190625153701.GA12905@phenom.ffwll.local>
References: <20181016222341.1537-1-drawat@vmware.com>
 <20181016222341.1537-5-drawat@vmware.com>
 <CAKMK7uEUN_-cdkMxvO1VwhD7YhGTNgd56y+Z8Pjv53Ri7wMSNw@mail.gmail.com>
 <20190625060132.rsidgloshp7oz4ud@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625060132.rsidgloshp7oz4ud@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t 5/5] tests/kms_selftest:
 Integrate kernel selftest test-drm_modeset
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: Petri Latvala <petri.latvala@intel.com>, intel-gfx <intel-gfx@lists.freedesktop.org>, IGT development <igt-dev@lists.freedesktop.org>, VMware Graphics <linux-graphics-maintainer@vmware.com>, Daniel Vetter <daniel@ffwll.ch>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMDk6MDE6MzJBTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDAzOjIwOjAyUE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBPbiBUdWUsIE9jdCAxNiwgMjAxOCBhdCAwMzoyMzo0MVBNIC0w
NzAwLCBEZWVwYWsgUmF3YXQgd3JvdGU6Cj4gPiA+IENhbGwga2VybmVsIHNlbGZ0ZXN0IG1vZHVs
ZSB0ZXN0LWRybV9tb2Rlc2V0IGZvciB0ZXN0aW5nIEtNUy4KPiA+ID4KPiA+ID4gdjI6Cj4gPiA+
IC0gQWRkIHRlc3QgYWxwaGFiZXRpY2FsbHkuCj4gPiA+IC0gQWRkIHRlc3QgdG8gbWVzb24gYnVp
bGQuCj4gPiA+Cj4gPiA+IHYzOiBSZW5hbWUgdG8ga21zX3NlbGZ0ZXN0Lgo+ID4gPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+ID4gCj4gPiBK
dXN0IHJlYWxpemVkIHRoYXQgdGhpcyBuZXZlciBsYW5kZWQgLi4uIGFueSByZWFzb25zPyBXb3Vs
ZCBiZSBuaWNlIHRvIGdldAo+ID4gdGhpcyBoYW5kbGVkLgo+ID4gCj4gPiBQZXRyaS9BcmVrPwo+
ID4gCj4gPiBDaGVlcnMsIERhbmllbAo+IAo+IFdoYXQgZG8geW91IG1lYW4gYnkgInRoaXMgbmV2
ZXIgbGFuZGVkIj8KPiAKPiBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL2lndC1n
cHUtdG9vbHMvY29tbWl0Lzc3NjZiMWUyMzQ4Ygo+IAo+IGNvbW1pdCA3NzY2YjFlMjM0OGIzMmNj
OGVkNThhOTcyYzZmZDUzYjIwMjc5NTQ5Cj4gQXV0aG9yOiAgICAgRGVlcGFrIFJhd2F0IDxkcmF3
YXRAdm13YXJlLmNvbT4KPiBBdXRob3JEYXRlOiBUdWUgT2N0IDE2IDE1OjIzOjQxIDIwMTggLTA3
MDAKPiBDb21taXQ6ICAgICBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgo+
IENvbW1pdERhdGU6IFdlZCBPY3QgMTcgMDk6NDE6MDcgMjAxOCArMDIwMAo+IAo+IHRlc3RzL2tt
c19zZWxmdGVzdDogSW50ZWdyYXRlIGtlcm5lbCBzZWxmdGVzdCB0ZXN0LWRybV9tb2Rlc2V0CgpI
bSBub3Qgc3VyZSB3aGF0IEkgbG9va2VkIGF0LCBidXQgaXQgd2FzbnQgdGhlcmUuIFNvcnJ5IGZv
ciB0aGUgbm9pc2UuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIs
IEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
