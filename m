Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35CD06E186
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Feb 2018 10:41:37 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180216103225.GC32553@ahiler-desk1.ger.corp.intel.com>
References: <20180215142206.29391-1-arkadiusz.hiler@intel.com>
 <151871230285.11261.11531812132312430691@mail.alporthouse.com>
 <20180216103225.GC32553@ahiler-desk1.ger.corp.intel.com>
Message-ID: <151877769227.7225.15779340154733977996@mail.alporthouse.com>
Date: Fri, 16 Feb 2018 10:41:32 +0000
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>, 
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMDItMTYgMTA6MzI6MjUpCj4gT24gVGh1LCBG
ZWIgMTUsIDIwMTggYXQgMDQ6MzE6NDJQTSArMDAwMCwgQ2hyaXMgV2lsc29uIHdyb3RlOgo+ID4g
UXVvdGluZyBBcmthZGl1c3ogSGlsZXIgKDIwMTgtMDItMTUgMTQ6MjI6MDYpCj4gPiA+IENjOiBW
aWxsZSBTeXJqYWxhIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KPiA+ID4gQ2M6IFBl
dHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgo+ID4gPiBTaWduZWQtb2ZmLWJ5
OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Cj4gPiA+IC0tLQo+
ID4gPiAgbGliL2lndF9rbXMuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMSBkZWxldGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
a21zLmMgYi9saWIvaWd0X2ttcy5jCj4gPiA+IGluZGV4IGVjYzdhNzk5Li4xZjc0MmJiNCAxMDA2
NDQKPiA+ID4gLS0tIGEvbGliL2lndF9rbXMuYwo+ID4gPiArKysgYi9saWIvaWd0X2ttcy5jCj4g
PiA+IEBAIC0xOTE5LDcgKzE5MTksNyBAQCB2b2lkIGlndF9kaXNwbGF5X2luaXQoaWd0X2Rpc3Bs
YXlfdCAqZGlzcGxheSwgaW50IGRybV9mZCkKPiA+ID4gICAgICAgICAgICAgICAgICAqIFdlIGRv
bid0IGFzc2lnbiBlYWNoIG91dHB1dCBhIHBpcGUgdW5sZXNzCj4gPiA+ICAgICAgICAgICAgICAg
ICAgKiBhIHBpcGUgaXMgc2V0IHdpdGggaWd0X291dHB1dF9zZXRfcGlwZSgpLgo+ID4gPiAgICAg
ICAgICAgICAgICAgICovCj4gPiA+IC0gICAgICAgICAgICAgICBvdXRwdXQtPmZvcmNlX3JlcHJv
YmUgPSB0cnVlOwo+ID4gPiArICAgICAgICAgICAgICAgb3V0cHV0LT5mb3JjZV9yZXByb2JlID0g
ZmFsc2U7Cj4gPiAKPiA+IFRoZSB2ZXJ5IGZpcnN0IGFwcGxpY2F0aW9uIG5lZWRzIHRvIGRvIGEg
Zm9yY2UgcHJvYmUgb3IgZWxzZSB0aGUgdGVzdHMKPiA+IGRvbid0IHdvcmsgb24gYSBub24tZmJk
ZXYgc3lzdGVtLgo+ID4gLUNocmlzCj4gCj4gR29vZCB0byBrbm93LiBTdGlsbCB3ZSBtYXkgY29u
c2lkZXIgYWRkaW5nIGEgY21kIGxpbmUgc3dpdGNoIC8gZGV0ZWN0aW9uCj4gZm9yIGZiZGV2IC8g
c29tZSBvdGhlciBtZWNoYW5pc20gdG8gbWFrZSBzdXJlIHRoYXQgcHJvYmUgd2FzIGRvbmUuCj4g
Cj4gUmVwcm9iaW5nIGVhY2ggc3VidGVzdCBpcyBxdWl0ZSBleHBlbnNpdmUuIFRoaXMgc2ltcGxl
IGNoYW5nZSBzYXZlcyB1cwo+IDIvMyBvZiB0aW1lIG9uIGttcyBza2lwcyAod2l0aCBqdXN0IGEg
c2luZ2xlIGRpc3BsYXkpLgoKTWFrZSByZXByb2JpbmcgZmFzdGVyLCBldmVyeWJvZHkgd2lucy4g
T25seSBkbyBhIGZvcmNlIGlmIHRoZSBjdXJyZW50CnN0YXR1cyBpcyB1bmNlcnRhaW47IHNhZGx5
IFVOS05PV04gc3RhdHVzIHdhcyByZW1vdmVkIGV2ZW4gdGhvdWdoIGl0IHdhcwpmb3IgdGhpcyBw
dXJwb3NlLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
