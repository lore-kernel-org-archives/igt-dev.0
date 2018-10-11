Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6545892DE
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Oct 2018 15:48:44 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id b7-v6so8703716edd.9
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Oct 2018 08:48:44 -0700 (PDT)
Date: Thu, 11 Oct 2018 17:48:40 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20181011154840.GG31561@phenom.ffwll.local>
References: <20181011002104.1845-1-drawat@vmware.com>
 <20181011002104.1845-4-drawat@vmware.com>
 <20181011145104.GJ9144@intel.com>
 <BYAPR05MB418182BBA7EF8892A5CB6D67BAE10@BYAPR05MB4181.namprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BYAPR05MB418182BBA7EF8892A5CB6D67BAE10@BYAPR05MB4181.namprd05.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] lib: Don't call
 igt_require_fb_modifiers() when no modifier
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
To: Deepak Singh Rawat <drawat@vmware.com>
Cc: Thomas Hellstrom <thellstrom@vmware.com>, "petri.latvala@intel.com" <petri.latvala@intel.com>, Sinclair Yeh <syeh@vmware.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, linux-graphics-maintainer <linux-graphics-maintainer@vmware.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTEsIDIwMTggYXQgMDM6Mzg6MTFQTSArMDAwMCwgRGVlcGFrIFNpbmdoIFJh
d2F0IHdyb3RlOgo+IAo+ID4gT24gV2VkLCBPY3QgMTAsIDIwMTggYXQgMDU6MjE6MDJQTSAtMDcw
MCwgRGVlcGFrIFJhd2F0IHdyb3RlOgo+ID4gPiB2bXdnZnggZG9lc24ndCBzdXBwb3J0IGZiIG1v
ZGlmaWVyIHNvIHNraXAgaWd0X3JlcXVpcmVfZmJfbW9kaWZpZXJzKCkKPiA+ID4gd2hlbiBtb2Rp
ZmllciBhcmUgbm90IHBhc3NlZC4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogRGVlcGFrIFJh
d2F0IDxkcmF3YXRAdm13YXJlLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBsaWIvaW9jdGxfd3JhcHBl
cnMuYyB8IDUgKysrKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2xpYi9pb2N0bF93cmFwcGVycy5j
IGIvbGliL2lvY3RsX3dyYXBwZXJzLmMKPiA+ID4gaW5kZXggMDkyOWM0M2YuLjNhMTFjYjZlIDEw
MDY0NAo+ID4gPiAtLS0gYS9saWIvaW9jdGxfd3JhcHBlcnMuYwo+ID4gPiArKysgYi9saWIvaW9j
dGxfd3JhcHBlcnMuYwo+ID4gPiBAQCAtMTY3OCw3ICsxNjc4LDEwIEBAIGludCBfX2ttc19hZGRm
YihpbnQgZmQsIHVpbnQzMl90IGhhbmRsZSwKPiA+ID4gIAlzdHJ1Y3QgZHJtX21vZGVfZmJfY21k
MiBmOwo+ID4gPiAgCWludCByZXQsIGk7Cj4gPiA+Cj4gPiA+IC0JaWd0X3JlcXVpcmVfZmJfbW9k
aWZpZXJzKGZkKTsKPiA+ID4gKwlpZiAobW9kaWZpZXIpCj4gPiA+ICsJCWlndF9yZXF1aXJlX2Zi
X21vZGlmaWVycyhmZCk7Cj4gPiA+ICsJZWxzZQo+ID4gPiArCQlmbGFncyAmPSB+RFJNX01PREVf
RkJfTU9ESUZJRVJTOwo+ID4gCj4gPiBUaGlzIHdvdWxkIHRoZW9yZXRpY2FsbHkgY2hhbmdlIHRo
ZSBiZWh2aW91ciBmb3IgaTkxNSBhdCBsZWFzdC4gV2l0aG91dAo+ID4gdGhlIG1vZGlmaWVycyBm
bGFnIHRoZSBrZXJuZWwgd2lsbCBwaWNrIHRoZSBtb2RpZmllciBmb3IgdXMgYmFzZWQgb24KPiA+
IHRoZSBibyB0aWxpbmcsIHdoaWNoIGluIHRoZW9yeSBtaWdodCBub3QgYmUgd2hhdCB3ZSB3YW50
ZWQuIEJ1dCBhdCBsZWFzdAo+ID4gaWd0X2ZiIHNob3VsZCBiZSBmaW5lIHdpdGggdGhhdC4KPiA+
IAo+ID4gTWF5YmUgaXQgd291bGQgYmUgYmV0dGVyIHRvIGp1c3Qgbm90IHBhc3MgdGhlIGZsYWdz
IGZyb20gdGhlIGNhbGxlciBhdAo+ID4gYWxsLCBhbmQgaW5zdGVhZCBoYXZlIF9fa21zX2FkZGZi
KCkgY2hlY2sgaWYgdGhlIGRyaXZlciBoYXMgbW9kaWZpZXJzCj4gPiBvciBub3QgYW5kIHNldCB0
aGUgZmxhZyBiYXNlZCBvbiB0aGF0Pwo+ID4gCj4gCj4gVGhhbmtzIFZpbGxlIGZvciB0aGUgcmV2
aWV3LiBJIHRob3VnaHQgb2YgY2hlY2tpbmcgZm9yIG1vZGlmaWVycyBzdXBwb3J0Cj4gaW4gX19r
bXNfYWRkZmIoKSBidXQgSSBkaXNjYXJkZWQgdGhlIGlkZWEgYXMgaXQgbG9va2VkIGFuIG92ZXJr
aWxsIHRvIG1lLAo+IGNoZWNraW5nIGVhY2ggdGltZSBfX2ttc19hZGRmYigpIGlzIGNhbGxlZC4g
TWF5IGJlIHN0YXRpYyB2YXJpYWJsZSB3aWxsCj4gYmUgYSBnb29kIGlkZWE/IEFuZCB5ZXMgcmVz
ZXR0aW5nIHRoZSBmbGFnIGZyb20gY2FsbGVyIGxvb2tzIGEgYmV0dGVyIHdheS4KCkkgdGhpbmsg
c2ltcGx5IHJlbW92aW5nIHRoZSBtb2RpZmllciBmbGFnIGlmZiB0aGUgZHJpdmVyIGRvZXNuJ3Qg
c3VwcG9ydAptb2RpZmllcnMgX2FuZF8gdGhlIG1vZGlmZXIgaXMgMCB3b3VsZCBiZSBvay4gQW5k
IHllcyBwcm9iYWJseSBiZXR0ZXIgdG8KZG8gdGhhdCBpbiB0aGUgaGlnaGVyLWxldmVsIGNhbGxz
IHRoYXQgY2FyZS4gSnVzdCBjb252ZXJ0aW5nIGlndF9mYiBzaG91bGQKY2F0Y2ggYSBsb3Qgb2Yg
dGVzdHMuCgpUaGVyZSdzIDIgbW9yZSBjcmMgdGVzdHMgeW91IG1pZ2h0IGNhcmUgYWJvdXQsIGJ1
dCB2bXdnZnggZG9lc24ndCBoYXZlIGNyYwpzdXBwb3J0IHNvIG5vdCByZWFsbHkgcmVsZXZhbnQu
IEFuZCBtYXliZSBieSB0aGVuIHlvdSBkbyBoYXZlIG1vZGlmaWVyCnN1cHBvcnQgOi0pCi1EYW5p
ZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9u
Cmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
