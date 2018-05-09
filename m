Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 608566E0C0
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 21:20:03 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20180509203629.10409-1-antonio.argenziano@intel.com>
 <152589874312.8613.1119392407572962611@mail.alporthouse.com>
 <b1065a2f-d245-66ad-3b95-34962592f686@intel.com>
In-Reply-To: <b1065a2f-d245-66ad-3b95-34962592f686@intel.com>
Message-ID: <152590079833.8613.16459791115117275636@mail.alporthouse.com>
Date: Wed, 09 May 2018 22:19:58 +0100
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fix possible NULL
 pointer dereference
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
To: Antonio Argenziano <antonio.argenziano@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBBbnRvbmlvIEFyZ2Vuemlhbm8gKDIwMTgtMDUtMDkgMjI6MTQ6NDMpCj4gCj4gCj4g
T24gMDkvMDUvMTggMTM6NDUsIENocmlzIFdpbHNvbiB3cm90ZToKPiA+IFF1b3RpbmcgQW50b25p
byBBcmdlbnppYW5vICgyMDE4LTA1LTA5IDIxOjM2OjI5KQo+ID4+IE1ha2Ugc3VyZSB0aGF0IG9u
ZSBvZiB0aGUgJ21tYXAnIGZ1bmN0aW9ucyByZXR1cm5zIGEgdmFsaWQgcG9pbnRlciB0bwo+ID4+
IGF2b2lkIGRlcmVmZXJlbmNpbmcgYSBOVUxMIHBvaW50ZXIgbGF0ZXIgb24uIChJc3N1ZSBmb3Vu
ZCB2aWEgY292ZXJpdHkpCj4gPiAKPiA+IE5vdCBtdWNoIG9mIGFuIGlzc3VlLCBpdCBkaWVzIG1v
bWVudHMgbGF0ZXIuIDotcAo+ID4gICAKPiA+PiBTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vu
emlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+Cj4gPj4gLS0tCj4gPj4gICBsaWIv
aWd0X2R1bW15bG9hZC5jIHwgMiArKwo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKQo+ID4+Cj4gPj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMgYi9saWIvaWd0
X2R1bW15bG9hZC5jCj4gPj4gaW5kZXggYmE5MTdiYTUuLmU5NmMwN2NmIDEwMDY0NAo+ID4+IC0t
LSBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMKPiA+PiArKysgYi9saWIvaWd0X2R1bW15bG9hZC5jCj4g
Pj4gQEAgLTEyNSw2ICsxMjUsOCBAQCBlbWl0X3JlY3Vyc2l2ZV9iYXRjaChpZ3Rfc3Bpbl90ICpz
cGluLCBpbnQgZmQsIHVpbnQzMl90IGN0eCwgdW5zaWduZWQgZW5naW5lLAo+ID4+ICAgICAgICAg
IGlmICghYmF0Y2gpCj4gPj4gICAgICAgICAgICAgICAgICBiYXRjaCA9IF9fZ2VtX21tYXBfX2d0
dChmZCwgb2JqW0JBVENIXS5oYW5kbGUsCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBCQVRDSF9TSVpFLCBQUk9UX1dSSVRFKTsKPiA+IAo+ID4gT3IgZ2VtX21t
YXBfX2d0dCgpLiBfXyB3YXMganVzdCBmb2xsb3dpbmcgdGhlIHBhdHRlcm4sIG90b2ggbGFjayBv
ZiBfXwo+ID4gaW5kaWNhdGVzIGZpbmFsIGp1c3QgYXMgd2VsbC4KPiAKPiBPSywgSSBjYW4gY2hh
bmdlIGl0LiBJIHdhcyB1bmRlY2lkZWQgYmV0d2VlbiB0aGlzIGFuZCBhc3NlcnQgYW55d2F5IDop
LgoKUHJlZW1wdGl2ZSAKClJldmlld2VkLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdp
bHNvbi5jby51az4KCm9uIGVpdGhlciBmb3JtLgotQ2hyaXMKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9pZ3QtZGV2Cg==
