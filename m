Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F7B8924F
 for <igt-dev@lists.freedesktop.org>; Mon, 17 Jun 2019 13:40:24 +0000 (UTC)
Date: Mon, 17 Jun 2019 16:40:21 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20190617134021.GU22949@platvala-desk.ger.corp.intel.com>
References: <20190613130623.5499-1-oleg.vasilev@intel.com>
 <20190614153051.GA5942@intel.com>
 <df8fd2e741a6345aa48168b39e1345fe5294ccbe.camel@intel.com>
 <20190617132645.GI5942@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617132645.GI5942@intel.com>
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
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDQ6MjY6NDVQTSArMDMwMCwgVmlsbGUgU3lyasOkbMOk
IHdyb3RlOgo+IE9uIE1vbiwgSnVuIDE3LCAyMDE5IGF0IDEwOjA1OjI5QU0gKzAwMDAsIFZhc2ls
ZXYsIE9sZWcgd3JvdGU6Cj4gPiBIaSwKPiA+IAo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3
LiBJJ3ZlIHNlbnQgYW4gdXBkYXRlZCBwYXRjaC4KPiA+IAo+ID4gT24gRnJpLCAyMDE5LTA2LTE0
IGF0IDE4OjMwICswMzAwLCBWaWxsZSBTeXJqw6Rsw6Qgd3JvdGU6Cj4gPiA+IE9uIFRodSwgSnVu
IDEzLCAyMDE5IGF0IDA0OjA2OjIzUE0gKzAzMDAsIE9sZWcgVmFzaWxldiB3cm90ZToKPiA+ID4g
PiAKPiA+ID4gPiArc3RhdGljIHZvaWQgZm9ybWF0X2hleF9zdHJpbmcodW5zaWduZWQgY2hhciBl
ZGlkW3N0YXRpYwo+ID4gPiA+IEVESURfTEVOR1RIXSwKPiA+ID4gPiArCQkJICAgICAgY2hhciBi
dWZbc3RhdGljIEVESURfTEVOR1RIICogNSArIDFdKQo+ID4gPiAKPiA+ID4gV2hhdCdzIHRoZSBk
ZWFsIHdpdGggdGhvc2UgJ3N0YXRpYydzPwo+ID4gCj4gPiBUaGlzIGVuZm9yY2VzIGFuIGFycmF5
IHNpemUgdG8gYmUgYXQgbGVhc3QgRURJRF9MRU5HVEguCj4gPiAKPiA+IGh0dHBzOi8vaGFtYmVy
Zy5uby9lcmxlbmQvcG9zdHMvMjAxMy0wMi0xOC1zdGF0aWMtYXJyYXktaW5kaWNlcy5odG1sCj4g
Cj4gSW50ZXJlc3RpbmcuIFVnbHksIGJ1dCBpbnRlcmVzdGluZy4KPiAKPiBEb2Vzbid0IGxvb2sg
bGlrZSBnY2MgY2FyZXMgYWJvdXQgdGhpcyBhdCBhbGwgdGhvdWdoLiBJIGRvZXNuJ3QgZXZlbgo+
IGNhcmUgaWYgSSBkbyBzaWxseSB0aGluZ3MgbGlrZToKPiAKPiBpbnQgZm9vKGludCB4W3N0YXRp
YyA4XSkKPiB7Cj4gCXJldHVybiB4WzIwXTsKPiB9Cj4gCj4gSSBndWVzcyBjbGFuZyBpcyBiZXR0
ZXI/CgpUaGUgOCBtZWFucyB0aGVyZSdzIGF0IGxlYXN0IDggZWxlbWVudHMsIGl0IGRvZXNuJ3Qg
cmVzdHJpY3QgdGhlcmUgYmVpbmcgbW9yZS4KCkFuZCBpdCdzIG1vc3RseSBmb3IgdGhlIGNhbGwg
c2l0ZS4gVHJ5IGNhbGxpbmcgZm9vKE5VTEwpIG5vdy4KCgotLSAKUGV0cmkgTGF0dmFsYQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
