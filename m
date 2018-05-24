Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163F06E71B
 for <igt-dev@lists.freedesktop.org>; Thu, 24 May 2018 15:40:41 +0000 (UTC)
Date: Thu, 24 May 2018 18:40:36 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20180524154036.GV23723@intel.com>
References: <cover.ab4e8068ec3bcd788fed734e68f4dac210fe2a3d.1527171699.git-series.maxime.ripard@bootlin.com>
 <538851bf02215e84605901cd494ed9a7abd82865.1527171699.git-series.maxime.ripard@bootlin.com>
 <20180524145813.GU23723@intel.com>
 <20180524151904.6ixjbows5m2id7y4@flea>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20180524151904.6ixjbows5m2id7y4@flea>
Subject: Re: [igt-dev] [PATCH v3 03/11] fb: Add format conversion routine
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
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: igt-dev@lists.freedesktop.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, eben@raspberrypi.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBNYXkgMjQsIDIwMTggYXQgMDU6MTk6MDRQTSArMDIwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBPbiBUaHUsIE1heSAyNCwgMjAxOCBhdCAwNTo1ODoxM1BNICswMzAwLCBWaWxsZSBT
eXJqw6Rsw6Qgd3JvdGU6Cj4gPiBPbiBUaHUsIE1heSAyNCwgMjAxOCBhdCAwNDoyNDo0MlBNICsw
MjAwLCBNYXhpbWUgUmlwYXJkIHdyb3RlOgo+ID4gPiBUaGUgY2hhbWVsaXVtIGZvcm1hdCBzdWJ0
ZXN0cyB3aWxsIG5lZWQgdG8gY29udmVydCB0aGUgcmVmZXJlbmNlIHBhdHRlcm4gdG8KPiA+ID4g
dGhlIGZvcm1hdCB0byBiZSB0ZXN0ZWQgb24gdGhlIERSTSBkZXZpY2UuCj4gPiA+IAo+ID4gPiBI
b3dldmVyLCBDYWlybyBpcyB2ZXJ5IGxpbWl0ZWQgd2hlbiBpdCBjb21lcyB0byBmb3JtYXQsIGFu
ZCB3aGlsZSBwaXhtYW4KPiA+ID4gaGFzIG11Y2ggbW9yZSBzdXBwb3J0IGZvciBmb3JtYXRzLCBp
dCdzIHN0aWxsIGZhbGxpbmcgc2hvcnQgY29tcGFyZWQgdG8KPiA+ID4gd2hhdCBEUk0gZXhwb3Nl
cywgZXNwZWNpYWxseSBvbiB0aGUgWVVWIHNpZGUuCj4gPiAKPiA+IFdlIGFscmVhZHkgaGF2ZSB0
aGUgY2FwYWJpbGl0eSB0byBkbyBmb3JtYXQgY29udmVyc2lvbnMgYXV0b21hZ2ljYWxseS4KPiA+
IEknbSBleHRlbmRpbmcgaXQgdG8gaGFuZGxlIG1vcmUgWVVWIHN0dWZmIGhlcmU6Cj4gPiBodHRw
czovL3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzQzNjUxLwo+ID4gCj4gPiBDYW4g
eW91IGhvb2sgdXAgdGhlIHBpeG1hbiBzdHVmZiBpbiB0aGUgc2FtZSB3YXkgc28gdGhhdCB3ZSBk
b24ndAo+ID4gaGF2ZSB0byBhbnkgZXhwbGljaXQgY29udmVyc2lvbiBzdHVmZiBpbiB0aGUgdGVz
dHMgdGhlbXNlbHZlcz8KPiAKPiBJIHJlYWxseSB0aGluayB0aGF0IHRoZSBhc3N1bXB0aW9uIHRo
YXQgY2Fpcm8gd2lsbCBoYW5kbGUgaXQgaXMgbm90IGEKPiBwcm9wZXIgZml0LiBDYWlybyBzdXBw
b3J0IGlzIHZlcnkgbGltaXRlZCwganVzdCBsaWtlIHBpeG1hbiBpcyB0byBhCj4gbGVzc2VyIGV4
dGVudCwgYW5kIHdlIHNob3VsZCBqdXN0IGJyZWFrIHRoZSBhc3N1bXB0aW9uIHRoYXQgd2Ugd2ls
bAo+IGdldCBhIGNhaXJvIHN1cmZhY2UgYWxsIHRoZSB0aW1lLgoKTm90IHN1cmUgd2hhdCB5b3Un
cmUgc2F5aW5nIGhlcmUuIFdlIGRvbid0IGFzc3VtZSBjYWlybyBoYW5kbGVzIGFsbAp0aGUgZm9y
bWF0cywgd2VsbCwgYmVjYXVzZSBpdCBkb2Vzbid0LiBXZSBqdXN0IG1hZ2ljYWxseSBjb252ZXJ0
CnRvL2Zyb20gWFJHQjg4OCBzbyB0aGF0IGNhaXJvIGRvZXNuJ3QgaGF2ZSB0byBoYW5kbGUgYW55
dGhpbmcgZWxzZS4KCi0tIApWaWxsZSBTeXJqw6Rsw6QKSW50ZWwKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
