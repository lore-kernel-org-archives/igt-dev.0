Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6E76E156
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2018 10:32:29 +0000 (UTC)
Date: Fri, 16 Feb 2018 12:32:25 +0200
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180216103225.GC32553@ahiler-desk1.ger.corp.intel.com>
References: <20180215142206.29391-1-arkadiusz.hiler@intel.com>
 <151871230285.11261.11531812132312430691@mail.alporthouse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <151871230285.11261.11531812132312430691@mail.alporthouse.com>
Subject: Re: [igt-dev] [CI] lib/igt_kms: Don't reprobe connectors during
 igt_display_init
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

T24gVGh1LCBGZWIgMTUsIDIwMTggYXQgMDQ6MzE6NDJQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdy
b3RlOgo+IFF1b3RpbmcgQXJrYWRpdXN6IEhpbGVyICgyMDE4LTAyLTE1IDE0OjIyOjA2KQo+ID4g
Q2M6IFZpbGxlIFN5cmphbGEgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgo+ID4gQ2M6
IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gU2lnbmVkLW9mZi1i
eTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgo+ID4gLS0tCj4g
PiAgbGliL2lndF9rbXMuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9s
aWIvaWd0X2ttcy5jCj4gPiBpbmRleCBlY2M3YTc5OS4uMWY3NDJiYjQgMTAwNjQ0Cj4gPiAtLS0g
YS9saWIvaWd0X2ttcy5jCj4gPiArKysgYi9saWIvaWd0X2ttcy5jCj4gPiBAQCAtMTkxOSw3ICsx
OTE5LDcgQEAgdm9pZCBpZ3RfZGlzcGxheV9pbml0KGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGlu
dCBkcm1fZmQpCj4gPiAgICAgICAgICAgICAgICAgICogV2UgZG9uJ3QgYXNzaWduIGVhY2ggb3V0
cHV0IGEgcGlwZSB1bmxlc3MKPiA+ICAgICAgICAgICAgICAgICAgKiBhIHBpcGUgaXMgc2V0IHdp
dGggaWd0X291dHB1dF9zZXRfcGlwZSgpLgo+ID4gICAgICAgICAgICAgICAgICAqLwo+ID4gLSAg
ICAgICAgICAgICAgIG91dHB1dC0+Zm9yY2VfcmVwcm9iZSA9IHRydWU7Cj4gPiArICAgICAgICAg
ICAgICAgb3V0cHV0LT5mb3JjZV9yZXByb2JlID0gZmFsc2U7Cj4gCj4gVGhlIHZlcnkgZmlyc3Qg
YXBwbGljYXRpb24gbmVlZHMgdG8gZG8gYSBmb3JjZSBwcm9iZSBvciBlbHNlIHRoZSB0ZXN0cwo+
IGRvbid0IHdvcmsgb24gYSBub24tZmJkZXYgc3lzdGVtLgo+IC1DaHJpcwoKR29vZCB0byBrbm93
LiBTdGlsbCB3ZSBtYXkgY29uc2lkZXIgYWRkaW5nIGEgY21kIGxpbmUgc3dpdGNoIC8gZGV0ZWN0
aW9uCmZvciBmYmRldiAvIHNvbWUgb3RoZXIgbWVjaGFuaXNtIHRvIG1ha2Ugc3VyZSB0aGF0IHBy
b2JlIHdhcyBkb25lLgoKUmVwcm9iaW5nIGVhY2ggc3VidGVzdCBpcyBxdWl0ZSBleHBlbnNpdmUu
IFRoaXMgc2ltcGxlIGNoYW5nZSBzYXZlcyB1cwoyLzMgb2YgdGltZSBvbiBrbXMgc2tpcHMgKHdp
dGgganVzdCBhIHNpbmdsZSBkaXNwbGF5KS4KCi0tIApDaGVlcnMsCkFyZWsKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
