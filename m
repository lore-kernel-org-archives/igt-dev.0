Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B04E893B9
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Apr 2019 07:22:38 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Wed, 10 Apr 2019 07:22:31 +0000
Message-ID: <310564af671c01bb8043272f9fb58bf727760b75.camel@intel.com>
References: <20190409122930.4262-1-mika.kahola@intel.com>
 <20190409125247.GM3888@intel.com>
In-Reply-To: <20190409125247.GM3888@intel.com>
Content-Language: en-US
Content-ID: <8C00E9306D799749ACB9979007B66305@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Check
 supported pixel format
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
To: "ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

UHVzaGVkLiBUaGFua3MgZm9yIHRoZSByZXZpZXchCgpPbiBUdWUsIDIwMTktMDQtMDkgYXQgMTU6
NTIgKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90ZToKPiBPbiBUdWUsIEFwciAwOSwgMjAxOSBh
dCAwMzoyOTozMFBNICswMzAwLCBNaWthIEthaG9sYSB3cm90ZToKPiA+IExldCdzIGFkZCBhIGNo
ZWNrIGZvciBzdXBwb3J0ZWQgcGl4ZWwgZm9ybWF0LiBPdGhlcndpc2UsIHdlIGZhaWwKPiA+IHRo
ZSB0ZXN0LAo+ID4gZm9yIGV4YW1wbGUsIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvciBtZXNzYWdl
Cj4gPiAKPiA+ICJbZHJtOmludGVsX2ZyYW1lYnVmZmVyX2luaXQgW2k5MTVdXSB1bnN1cHBvcnRl
ZCBwaXhlbCBmb3JtYXQgWTIxMAo+ID4gbGl0dGxlLWVuZGlhbgo+ID4gKDB4MzAzMTMyNTkpIC8g
bW9kaWZpZXIgMHgxMDAwMDAwMDAwMDAwMDMiCj4gPiAKPiA+IEJ1Z3ppbGxhOiBodHRwczovL2J1
Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTAzNjkKPiA+IFNpZ25lZC1vZmYt
Ynk6IE1pa2EgS2Fob2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6
IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4gCj4gPiAt
LS0KPiA+ICB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMyArKy0KPiA+ICAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQg
YS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+
ID4gaW5kZXggYmIxNGIyY2QuLmU4NDNiZjg2IDEwMDY0NAo+ID4gLS0tIGEvdGVzdHMva21zX3Bs
YW5lX3NjYWxpbmcuYwo+ID4gKysrIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwo+ID4gQEAg
LTIzMiw3ICsyMzIsOCBAQCBzdGF0aWMgdm9pZAo+ID4gdGVzdF9zY2FsZXJfd2l0aF9waXhlbF9m
b3JtYXRfcGlwZShkYXRhX3QgKmQsIGVudW0gcGlwZSBwaXBlLAo+ID4gaWd0X291Cj4gPiAgCQkJ
Zm9yIChpbnQgaiA9IDA7IGogPCBwbGFuZS0+ZHJtX3BsYW5lLQo+ID4gPmNvdW50X2Zvcm1hdHM7
IGorKykgewo+ID4gIAkJCQl1aW50MzJfdCBmb3JtYXQgPSBwbGFuZS0+ZHJtX3BsYW5lLQo+ID4g
PmZvcm1hdHNbal07Cj4gPiAgCj4gPiAtCQkJCWlmIChpZ3RfZmJfc3VwcG9ydGVkX2Zvcm1hdChm
b3JtYXQpKQo+ID4gKwkJCQlpZiAoaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0KSAmJgo+
ID4gKwkJCQkgICAgaWd0X3BsYW5lX2hhc19mb3JtYXRfbW9kKHBsYW5lLAo+ID4gZm9ybWF0LCB0
aWxpbmcpKQo+ID4gIAkJCQkJY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkLAo+ID4gcGxh
bmUsCj4gPiAgCQkJCQkJCQkgICAgIGZvCj4gPiBybWF0LCB0aWxpbmcsCj4gPiAgCQkJCQkJCQkg
ICAgIHBpCj4gPiBwZSwgb3V0cHV0LCBJR1RfUk9UQVRJT05fMCk7Cj4gPiAtLSAKPiA+IDIuMTcu
MQo+IAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
