Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072826E034
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2019 08:12:39 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id e3so18621747edr.10
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Jul 2019 01:12:38 -0700 (PDT)
Date: Tue, 16 Jul 2019 10:12:34 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190716081234.GS15868@phenom.ffwll.local>
References: <20190711172135.6398-1-daniel.vetter@ffwll.ch>
 <20190715081019.h36iphyiwlq72mh3@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190715081019.h36iphyiwlq72mh3@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Ditch "DRIVER_* for kms tests"
 cargo cult
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
Cc: Liviu Dudau <liviu.dudau@arm.com>, IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdWwgMTUsIDIwMTkgYXQgMTE6MTA6MTlBTSArMDMwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFRodSwgSnVsIDExLCAyMDE5IGF0IDA3OjIxOjM1UE0gKzAyMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBLTVMgaXMgbWVhbnQgdG8gYmUgYSAoYXQgbGVhc3Qgc29tZXdo
YXQpIGdlbmVyaWMgdXNlcnNwYWNlIEFQSS4gV2UgZG8KPiA+IG5vdCB3YW50IG5vciBuZWVkIHRv
IGFkZCBhIHNwZWNpYWwgbWF0Y2ggZnVuY3Rpb24gZm9yIGV2ZXJ5IGRyaXZlcgo+ID4gZXZlciB3
cml0dGVuLCB0aGF0IGRvZXNuJ3QgbWFrZSBzZW5zZSwgZGVmZWF0cyB0aGUgcG9pbnQgb2YgaGF2
aW5nCj4gPiBnZW5lcmljIHRlc3RzIGZvciBhIGdlbmVyaWMgdGVzdHN1aXRlLCBhbmQgcmVhbGx5
IGRvZXNuJ3Qgc2NhbGUuCj4gPiAKPiA+IEFsc28gYWRkIGEgY29tbWVudCBzbyBwZW9wbGUgZG9u
J3QgdHJ5IHRvIGFkZCBldmVyIG1vcmUgb2YgdGhlc2UuCj4gPiAKPiA+IEFsc28sIHRoaXMgbWVh
bnMgbm8gYXV0b2xvYWRpbmcgZm9yIHlvdSwgYnV0IHJlYWxseSBpZ3Qgc2hvdWxkCj4gPiByZWlu
dmVudCB1ZGV2LCBhbmQgbW9zdGx5IHRoaXMgd2FzIG5lZWRlZCBmb3IgMiByZWFzb25zOgo+ID4g
LSBDSSBjb25maWd1cmF0aW9uIGZhbGxpbmcgdG8gcGllY2VzIGJlY2F1c2UgdGVzdHMgdW5sb2Fk
ZWQgYSBkcml2ZXIsCj4gPiAgIGFuZCB0aGVuIGRpZWQgYmVmb3JlIGNsZWFuaW5nIHVwLgo+ID4g
LSB2Z2VtLCB3aGljaCBpcyBmYWtlLCBhbmQgbmVlZHMgdG8gYmUgcmVxdWVzdGVkIGV4cGxpY3Rp
bHkuCj4gPiAKPiA+IFdlIG1pZ2h0IHdhbnQgdG8gdGhyb3cgdGhhdCBhbGwgb3V0IGFnYWluLCBl
eGNlcHQgZm9yIHZnZW0uCj4gPiAKPiA+IENjOiBMaXZpdSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJt
LmNvbT4KPiA+IENjOiBEZWVwYWsgUmF3YXQgPGRyYXdhdEB2bXdhcmUuY29tPgo+ID4gQ2M6IEhh
cnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50bGFuZEBhbWQuY29tPgo+ID4gQ2M6IE5pY2hvbGFzIEth
emxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4KPiA+IENjOiBMZW8gTGkgPHN1
bnBlbmcubGlAYW1kLmNvbT4KPiA+IENjOiBNaWNoYcWCIFdpbmlhcnNraSA8bWljaGFsLndpbmlh
cnNraUBpbnRlbC5jb20+Cj4gPiBDYzogIlNlciwgU2ltb24iIDxzaW1vbi5zZXJAaW50ZWwuY29t
Pgo+ID4gQ2M6IE9sZWcgVmFzaWxldiA8b2xlZy52YXNpbGV2QGludGVsLmNvbT4KPiA+IENjOiBB
cmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KPiAKPiBBY2tlZC1i
eTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgoKQW5kIHB1c2hp
bmcsIHRoYW5rcyBmb3IgdGFraW5nIGEgbG9vay4KLURhbmllbAotLSAKRGFuaWVsIFZldHRlcgpT
b2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
