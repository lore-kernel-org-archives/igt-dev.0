Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB716E331
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 09:02:45 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id s16so10924428edr.3
 for <igt-dev@lists.freedesktop.org>; Tue, 02 Apr 2019 02:02:45 -0700 (PDT)
Date: Tue, 2 Apr 2019 11:02:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190402090241.GH2665@phenom.ffwll.local>
References: <20190401151707.4576-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190401151707.4576-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: Fix crop test
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
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBBcHIgMDEsIDIwMTkgYXQgMDY6MTc6MDdQTSArMDMwMCwgVmlsbGUgU3lyamFsYSB3
cm90ZToKPiBGcm9tOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgo+IAo+IFNldCB0aGUgc3JjL2RzdCB2aWV3cG9ydHMgY29ycmVjdGx5IHdoZW4gdHJ5aW5n
IHRvIGNyb3Agb2ZmIHRoZQo+IGVkZ2VzLgo+IAo+IEJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJl
ZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTAyOTYKPiBGaXhlczogODBlYjYxNDU5Nzkx
ICgidGVzdHMva21zX3BsYW5lOiBSZW1vdmUgdGhlIHVwc2NhbGluZyByZXF1aXJlbWVudCIpCj4g
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KCk9vcHMsIGJhZCByZXZpZXcgYnkgbWUgOi0vCgpSZXZpZXdlZC1ieTogRGFuaWVsIFZl
dHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KCi4uLiBidXQgbm90IHN1cmUgaG93IG11Y2gg
dmFsdWUgdGhlcmUgaXMgaW4gdGhhdCAuLi4KLURhbmllbAoKPiAtLS0KPiAgdGVzdHMva21zX3Bs
YW5lLmMgfCA1ICsrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVs
ZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNf
cGxhbmUuYwo+IGluZGV4IDMzZTI5MDVhOGQ3MS4uNDcxYmNiZWI4Zjc3IDEwMDY0NAo+IC0tLSBh
L3Rlc3RzL2ttc19wbGFuZS5jCj4gKysrIGIvdGVzdHMva21zX3BsYW5lLmMKPiBAQCAtNDM2LDgg
KzQzNiwxMSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2Zvcm1hdF9wbGFuZV9jb2xvcihkYXRhX3QgKmRh
dGEsIGVudW0gcGlwZSBwaXBlLAo+ICAJLyoKPiAgCSAqIGlmIGNsYW1waW5nIHRlc3QuIERSTV9G
T1JNQVRfWFJHQjg4ODggaXMgdXNlZCBmb3IgcmVmZXJlbmNlIGNvbG9yLgo+ICAJICovCj4gLQlp
ZiAoZGF0YS0+Y3JvcCAhPSAwICYmIGZvcm1hdCAhPSBEUk1fRk9STUFUX1hSR0I4ODg4KQo+ICsJ
aWYgKGRhdGEtPmNyb3AgIT0gMCAmJiBmb3JtYXQgIT0gRFJNX0ZPUk1BVF9YUkdCODg4OCkgewo+
ICAJCWlndF9mYl9zZXRfcG9zaXRpb24oZmIsIHBsYW5lLCBkYXRhLT5jcm9wLCBkYXRhLT5jcm9w
KTsKPiArCQlpZ3RfZmJfc2V0X3NpemUoZmIsIHBsYW5lLCB3aWR0aCwgaGVpZ2h0KTsKPiArCQlp
Z3RfcGxhbmVfc2V0X3NpemUocGxhbmUsIHdpZHRoLCBoZWlnaHQpOwo+ICsJfQo+ICAKPiAgCWln
dF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3BsYXkuaXNfYXRvbWlj
ID8gQ09NTUlUX0FUT01JQyA6IENPTU1JVF9VTklWRVJTQUwpOwo+ICAJaWd0X3BpcGVfY3JjX2dl
dF9jdXJyZW50KGRhdGEtPmRpc3BsYXkuZHJtX2ZkLCBkYXRhLT5waXBlX2NyYywgY3JjKTsKPiAt
LSAKPiAyLjE5LjIKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGlndC1kZXYgbWFpbGluZyBsaXN0Cj4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXYKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3Jh
dGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
