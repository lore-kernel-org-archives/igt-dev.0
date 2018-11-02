Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CB026E5CB
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Nov 2018 19:30:32 +0000 (UTC)
Date: Fri, 2 Nov 2018 21:30:29 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20181102193029.GD9144@intel.com>
References: <20181102190651.25969-1-ville.syrjala@linux.intel.com>
 <20181102190651.25969-4-ville.syrjala@linux.intel.com>
 <154118622365.30246.6205579277916811232@skylake-alporthouse-com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <154118622365.30246.6205579277916811232@skylake-alporthouse-com>
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

T24gRnJpLCBOb3YgMDIsIDIwMTggYXQgMDc6MTc6MDNQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgVmlsbGUgU3lyamFsYSAoMjAxOC0xMS0wMiAxOTowNjo1MSkKPiA+ICtz
dGF0aWMgdm9pZCAqY29udmVydF9zcmNfZ2V0KGNvbnN0IHN0cnVjdCBmYl9jb252ZXJ0ICpjdnQp
Cj4gPiArewo+ID4gKyAgICAgICB2b2lkICpidWY7Cj4gPiArCj4gPiArICAgICAgIGlmICghY3Z0
LT5zcmMuc2xvd19yZWFkcykKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gY3Z0LT5zcmMucHRy
Owo+ID4gKwo+ID4gKyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBSZWFkaW5nIGZyb20gdGhlIEJP
IGlzIGF3ZnVsbHkgc2xvdyBiZWNhdXNlIG9mIGxhY2sgb2YgcmVhZCBjYWNoaW5nLAo+ID4gKyAg
ICAgICAgKiBpdCdzIGZhc3RlciB0byBjb3B5IHRoZSB3aG9sZSBCTyB0byBhIHRlbXBvcmFyeSBi
dWZmZXIgYW5kIGNvbnZlcnQKPiA+ICsgICAgICAgICogZnJvbSB0aGVyZS4KPiA+ICsgICAgICAg
ICovCj4gPiArICAgICAgIGJ1ZiA9IG1hbGxvYyhjdnQtPnNyYy5mYi0+c2l6ZSk7Cj4gCj4gaWYg
KCFidWYpCj4gCXJldHVybiBjdnQtPnNyYy5wdHI7CgpTdXJlLCB3aHkgbm90LgoKPiAKPiA+ICsg
ICAgICAgaWd0X21lbWNweV9mcm9tX3djKGJ1ZiwgY3Z0LT5zcmMucHRyLCBjdnQtPnNyYy5mYi0+
c2l6ZSk7Cj4gPiArCj4gPiArICAgICAgIHJldHVybiBidWY7Cj4gPiArfQo+ID4gKwo+ID4gK3N0
YXRpYyB2b2lkIGNvbnZlcnRfc3JjX3B1dChjb25zdCBzdHJ1Y3QgZmJfY29udmVydCAqY3Z0LAo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgIHZvaWQgKnNyY19idWYpCj4gPiArewo+ID4g
KyAgICAgICAvKgo+ID4gKyAgICAgICAgKiBSZWFkaW5nIGZyb20gdGhlIEJPIGlzIGF3ZnVsbHkg
c2xvdyBiZWNhdXNlIG9mIGxhY2sgb2YgcmVhZCBjYWNoaW5nLAo+ID4gKyAgICAgICAgKiBpdCdz
IGZhc3RlciB0byBjb3B5IHRoZSB3aG9sZSBCTyB0byBhIHRlbXBvcmFyeSBidWZmZXIgYW5kIGNv
bnZlcnQKPiA+ICsgICAgICAgICogZnJvbSB0aGVyZS4KPiA+ICsgICAgICAgICovCj4gPiArICAg
ICAgIGlmIChjdnQtPnNyYy5zbG93X3JlYWRzKQo+IAo+IAlpZiAoc3JjX2J1ZiAhPSBjdnQtPnNy
Yy5wdHIpCgpZZXMsIHRoYXQgaXMgYmV0dGVyICh0bSkuCgo+IAo+ID4gKyAgICAgICAgICAgICAg
IGZyZWUoc3JjX2J1Zik7Cj4gPiArfQoKLS0gClZpbGxlIFN5cmrDpGzDpApJbnRlbApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
