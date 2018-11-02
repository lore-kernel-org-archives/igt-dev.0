Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7D1C6E5C7
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 19:37:17 +0000 (UTC)
Date: Fri, 2 Nov 2018 21:37:14 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181102193714.GE9144@intel.com>
References: <20181102190651.25969-1-ville.syrjala@linux.intel.com>
 <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <154118622365.30246.6205579277916811232@skylake-alporthouse-com>
 <20181102193029.GD9144@intel.com>
 <154118712205.30246.6540566950532000022@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <154118712205.30246.6540566950532000022@skylake-alporthouse-com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/4] lib/igt_fb: Generalize the slow
 read from gtt mmap handling
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDc6MzI6MDJQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyasOkbMOkICgyMDE4LTExLTAyIDE5OjMwOjI5KQo+ID4g
T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDc6MTc6MDNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+ID4gPiBRdW90aW5nIFZpbGxlIFN5cmphbGEgKDIwMTgtMTEtMDIgMTk6MDY6NTEpCj4g
PiA+ID4gK3N0YXRpYyB2b2lkICpjb252ZXJ0X3NyY19nZXQoY29uc3Qgc3RydWN0IGZiX2NvbnZl
cnQgKmN2dCkKPiA+ID4gPiArewo+ID4gPiA+ICsgICAgICAgdm9pZCAqYnVmOwo+ID4gPiA+ICsK
PiA+ID4gPiArICAgICAgIGlmICghY3Z0LT5zcmMuc2xvd19yZWFkcykKPiA+ID4gPiArICAgICAg
ICAgICAgICAgcmV0dXJuIGN2dC0+c3JjLnB0cjsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAv
Kgo+ID4gPiA+ICsgICAgICAgICogUmVhZGluZyBmcm9tIHRoZSBCTyBpcyBhd2Z1bGx5IHNsb3cg
YmVjYXVzZSBvZiBsYWNrIG9mIHJlYWQgY2FjaGluZywKPiA+ID4gPiArICAgICAgICAqIGl0J3Mg
ZmFzdGVyIHRvIGNvcHkgdGhlIHdob2xlIEJPIHRvIGEgdGVtcG9yYXJ5IGJ1ZmZlciBhbmQgY29u
dmVydAo+ID4gPiA+ICsgICAgICAgICogZnJvbSB0aGVyZS4KPiA+ID4gPiArICAgICAgICAqLwo+
ID4gPiA+ICsgICAgICAgYnVmID0gbWFsbG9jKGN2dC0+c3JjLmZiLT5zaXplKTsKPiA+ID4gCj4g
PiA+IGlmICghYnVmKQo+ID4gPiAgICAgICByZXR1cm4gY3Z0LT5zcmMucHRyOwo+ID4gCj4gPiBT
dXJlLCB3aHkgbm90Lgo+IAo+IFRoZSBvdGhlciBjaG9pY2UgYmVpbmcgaWd0X2Fzc2VydChidWYp
IG9yIGlndF94bWFsbG9jKCkgOikKCkkgZmlndXJlZCB0aGUgTlVMTCBwdHIgZXhwbG9zaW9uIGlz
IGFzIGdvb2QgYXMgYW4gYXNzZXJ0LiBCdXQKc2luY2UgaXQncyB0cml2aWFsIHRvIGhhbmRsZSBp
dCBncmFjZWZ1bGx5IGxldCdzIGRvIHRoYXQuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
