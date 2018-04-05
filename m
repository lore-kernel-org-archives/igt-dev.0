Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC0566E6EA
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 09:18:38 +0000 (UTC)
Date: Thu, 5 Apr 2018 12:18:34 +0300
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Message-ID: <20180405091834.GA14489@ahiler-desk1.ger.corp.intel.com>
References: <20180330154939.20647-1-daniels@collabora.com>
 <95cd7da4-fbba-9ac3-404c-3a0eb69c3a35@intel.com>
 <CAPj87rNAHOJNvhyO=BAUCvVYV5XrHJrU7v3Wv45FXNfu4qQX9Q@mail.gmail.com>
 <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
 <20180404140013.GF9570@ahiler-desk1.ger.corp.intel.com>
 <CAPj87rOCKShi9+FLvgC2koqKppHM3EOiiBvc8+b37EWba+8NkA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPj87rOCKShi9+FLvgC2koqKppHM3EOiiBvc8+b37EWba+8NkA@mail.gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_getfb: Use fixtures and
 subtest groups
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
To: Daniel Stone <daniel@fooishbar.org>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBBcHIgMDQsIDIwMTggYXQgMDU6Mjg6MTNQTSArMDEwMCwgRGFuaWVsIFN0b25lIHdy
b3RlOgo+IEhpIEFya2FkaXVzeiwKPiAKPiBPbiA0IEFwcmlsIDIwMTggYXQgMTU6MDAsIEFya2Fk
aXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4gd3JvdGU6Cj4gPiBPbiBNb24s
IEFwciAwMiwgMjAxOCBhdCAxMDoxMzoxOUFNIC0wNzAwLCBBbnRvbmlvIEFyZ2Vuemlhbm8gd3Jv
dGU6Cj4gPj4gT24gMDIvMDQvMTggMDY6MDIsIERhbmllbCBTdG9uZSB3cm90ZToKPiA+PiA+IFRv
IGJlIGNsZWFyLCBkb2VzIHRoaXMgbWVhbiB0aGF0IGVhY2ggcGllY2Ugb2YgZml4dHVyZSBhbmQg
aWd0X3N1YnRlc3QKPiA+PiA+IGRlZmluaXRpb24gc2hvdWxkIGxpdmUgaW5zaWRlIG1haW4/Cj4g
Pj4KPiA+PiBJIGRvbid0IHRoaW5rIHRoZXJlIGlzIGEgcnVsZSBmb3IgdGhhdCwgaXQgbG9va3Mg
YmV0dGVyIHRoYXQgd2F5Cj4gPj4gKGZpeHR1cmVzL2lndF9zdWJ0ZXN0L3N1YnRlc3RfZ3JvdXAg
YWxsIGluIHRoZSBtYWluKSBJTU8gOikuIEFsc28gaXQgaXMgd2hhdAo+ID4+IEkndmUgZm91bmQg
aW4gbW9zdCBpZiBub3QgYWxsIHRlc3RzIEkndmUgbG9va2VkIGF0Lgo+ID4KPiA+IERlZmluYXRl
bHkgbm90IGEgcnVsZSwgYW5kIGRlZmluYXRlbHkgbm90IGEgcGF0Y2ggdG8gZW5mb3JjZSBzdWNo
Cj4gPiBwcmVmZXJlbmNlIDotUAo+ID4KPiA+IEJ1dCBnZW5lcmFsbHkgaXQncyBhIGdvb2QgZGVm
YXVsdC4KPiAKPiBUaGFua3MgZm9yIHB1c2hpbmcgdGhpcy4gSSBoYXZlbid0IGRvbmUgdGhlIHJl
d29yayB5ZXQgYmVjYXVzZSBJJ3ZlCj4gYmVlbiBidXN5IHdpdGggc29tZSBtb3JlIHVyZ2VudCBm
aXJlcyB0aGlzIHdlZWs7IEknbGwgcmV3cml0ZQo+IGV2ZXJ5dGhpbmcgdG8gYmUgZGlyZWN0bHkg
dW5kZXIgbWFpbigpIGxhdGVyIHRoaXMgd2Vlay4KPiAKPiBDaGVlcnMsCj4gRGFuaWVsCgpUaGVy
ZSdzIG5vIHJlYWwgbmVlZC4gVGhlIHRlc3QgaXMgZWFzeSB0byBmb2xsb3cgYXMgaXQgaXMgYW5k
IEkKcGVyc29uYWxseSBsaWtlIHRoZSBncm91cGluZyBkb25lIHRoaXMgd2F5LgoKQXMgSSd2ZSBz
YWlkIC0gaXQncyBqdXN0IGEgZ29vZCBkZWZhdWx0IGFuZCBub3QgbXVjaCBtb3JlLgoKLS0gCkNo
ZWVycywKQXJlawpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
