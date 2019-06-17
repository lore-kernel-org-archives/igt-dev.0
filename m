Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B944A89256
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2019 14:09:21 +0000 (UTC)
Date: Mon, 17 Jun 2019 17:09:06 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20190617140906.GJ5942@intel.com>
References: <20190613130623.5499-1-oleg.vasilev@intel.com>
 <20190614153051.GA5942@intel.com>
 <df8fd2e741a6345aa48168b39e1345fe5294ccbe.camel@intel.com>
 <20190617132645.GI5942@intel.com>
 <20190617134021.GU22949@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617134021.GU22949@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH v2] tests/i915_pm_rpm: improved strictness and
 verbosity of i2c subtest
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
To: "Vasilev, Oleg" <oleg.vasilev@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDQ6NDA6MjFQTSArMDMwMCwgUGV0cmkgTGF0dmFsYSB3
cm90ZToKPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAwNDoyNjo0NVBNICswMzAwLCBWaWxsZSBT
eXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBNb24sIEp1biAxNywgMjAxOSBhdCAxMDowNToyOUFNICsw
MDAwLCBWYXNpbGV2LCBPbGVnIHdyb3RlOgo+ID4gPiBIaSwKPiA+ID4gCj4gPiA+IFRoYW5rIHlv
dSBmb3IgdGhlIHJldmlldy4gSSd2ZSBzZW50IGFuIHVwZGF0ZWQgcGF0Y2guCj4gPiA+IAo+ID4g
PiBPbiBGcmksIDIwMTktMDYtMTQgYXQgMTg6MzAgKzAzMDAsIFZpbGxlIFN5cmrDpGzDpCB3cm90
ZToKPiA+ID4gPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAwNDowNjoyM1BNICswMzAwLCBPbGVn
IFZhc2lsZXYgd3JvdGU6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+ICtzdGF0aWMgdm9pZCBmb3JtYXRf
aGV4X3N0cmluZyh1bnNpZ25lZCBjaGFyIGVkaWRbc3RhdGljCj4gPiA+ID4gPiBFRElEX0xFTkdU
SF0sCj4gPiA+ID4gPiArCQkJICAgICAgY2hhciBidWZbc3RhdGljIEVESURfTEVOR1RIICogNSAr
IDFdKQo+ID4gPiA+IAo+ID4gPiA+IFdoYXQncyB0aGUgZGVhbCB3aXRoIHRob3NlICdzdGF0aWMn
cz8KPiA+ID4gCj4gPiA+IFRoaXMgZW5mb3JjZXMgYW4gYXJyYXkgc2l6ZSB0byBiZSBhdCBsZWFz
dCBFRElEX0xFTkdUSC4KPiA+ID4gCj4gPiA+IGh0dHBzOi8vaGFtYmVyZy5uby9lcmxlbmQvcG9z
dHMvMjAxMy0wMi0xOC1zdGF0aWMtYXJyYXktaW5kaWNlcy5odG1sCj4gPiAKPiA+IEludGVyZXN0
aW5nLiBVZ2x5LCBidXQgaW50ZXJlc3RpbmcuCj4gPiAKPiA+IERvZXNuJ3QgbG9vayBsaWtlIGdj
YyBjYXJlcyBhYm91dCB0aGlzIGF0IGFsbCB0aG91Z2guIEkgZG9lc24ndCBldmVuCj4gPiBjYXJl
IGlmIEkgZG8gc2lsbHkgdGhpbmdzIGxpa2U6Cj4gPiAKPiA+IGludCBmb28oaW50IHhbc3RhdGlj
IDhdKQo+ID4gewo+ID4gCXJldHVybiB4WzIwXTsKPiA+IH0KPiA+IAo+ID4gSSBndWVzcyBjbGFu
ZyBpcyBiZXR0ZXI/Cj4gCj4gVGhlIDggbWVhbnMgdGhlcmUncyBhdCBsZWFzdCA4IGVsZW1lbnRz
LCBpdCBkb2Vzbid0IHJlc3RyaWN0IHRoZXJlIGJlaW5nIG1vcmUuCgpBaCwgeWVzLiBUaGF0IHdh
cyBhIGJhZCBleGFtcGxlLiBCdXQgaXQgZG9lc24ndCB3YXJuIGlmIEkgY2FsbCBpdAp3aXRoIGFu
IGFycmF5IHNtYWxsZXIgdGhhbiB0aGUgOCBlbGVtZXRzIGVpdGhlci4KCj4gCj4gQW5kIGl0J3Mg
bW9zdGx5IGZvciB0aGUgY2FsbCBzaXRlLiBUcnkgY2FsbGluZyBmb28oTlVMTCkgbm93LgoKTm8g
d2FybmluZ3MuCgpTbyB1bmxlc3MgdGhlcmUncyBhIG5ldyAtVyBrbm9iIGZvciB0aGlzIHdoaWNo
IGlzbid0IHBhcnQgb2YgLVdhbGwKLVdleHRyYSB0aGlzIHNlZW1zIHBvaW50bGVzcyB3aXRoIGdj
YyAod2VsbCwgYXQgbGVhc3QgZ2NjIDguMykuCgotLSAKVmlsbGUgU3lyasOkbMOkCkludGVsCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
