Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x22e.google.com (mail-wm0-x22e.google.com
 [IPv6:2a00:1450:400c:c09::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE1A46E23A
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Apr 2018 16:28:15 +0000 (UTC)
Received: by mail-wm0-x22e.google.com with SMTP id x82so44124480wmg.1
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Apr 2018 09:28:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180404140013.GF9570@ahiler-desk1.ger.corp.intel.com>
References: <20180330154939.20647-1-daniels@collabora.com>
 <95cd7da4-fbba-9ac3-404c-3a0eb69c3a35@intel.com>
 <CAPj87rNAHOJNvhyO=BAUCvVYV5XrHJrU7v3Wv45FXNfu4qQX9Q@mail.gmail.com>
 <e5ed19e2-829e-ad2d-3968-ba0f19c8d059@intel.com>
 <20180404140013.GF9570@ahiler-desk1.ger.corp.intel.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Wed, 4 Apr 2018 17:28:13 +0100
Message-ID: <CAPj87rOCKShi9+FLvgC2koqKppHM3EOiiBvc8+b37EWba+8NkA@mail.gmail.com>
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
To: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SGkgQXJrYWRpdXN6LAoKT24gNCBBcHJpbCAyMDE4IGF0IDE1OjAwLCBBcmthZGl1c3ogSGlsZXIg
PGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+IHdyb3RlOgo+IE9uIE1vbiwgQXByIDAyLCAyMDE4
IGF0IDEwOjEzOjE5QU0gLTA3MDAsIEFudG9uaW8gQXJnZW56aWFubyB3cm90ZToKPj4gT24gMDIv
MDQvMTggMDY6MDIsIERhbmllbCBTdG9uZSB3cm90ZToKPj4gPiBUbyBiZSBjbGVhciwgZG9lcyB0
aGlzIG1lYW4gdGhhdCBlYWNoIHBpZWNlIG9mIGZpeHR1cmUgYW5kIGlndF9zdWJ0ZXN0Cj4+ID4g
ZGVmaW5pdGlvbiBzaG91bGQgbGl2ZSBpbnNpZGUgbWFpbj8KPj4KPj4gSSBkb24ndCB0aGluayB0
aGVyZSBpcyBhIHJ1bGUgZm9yIHRoYXQsIGl0IGxvb2tzIGJldHRlciB0aGF0IHdheQo+PiAoZml4
dHVyZXMvaWd0X3N1YnRlc3Qvc3VidGVzdF9ncm91cCBhbGwgaW4gdGhlIG1haW4pIElNTyA6KS4g
QWxzbyBpdCBpcyB3aGF0Cj4+IEkndmUgZm91bmQgaW4gbW9zdCBpZiBub3QgYWxsIHRlc3RzIEkn
dmUgbG9va2VkIGF0Lgo+Cj4gRGVmaW5hdGVseSBub3QgYSBydWxlLCBhbmQgZGVmaW5hdGVseSBu
b3QgYSBwYXRjaCB0byBlbmZvcmNlIHN1Y2gKPiBwcmVmZXJlbmNlIDotUAo+Cj4gQnV0IGdlbmVy
YWxseSBpdCdzIGEgZ29vZCBkZWZhdWx0LgoKVGhhbmtzIGZvciBwdXNoaW5nIHRoaXMuIEkgaGF2
ZW4ndCBkb25lIHRoZSByZXdvcmsgeWV0IGJlY2F1c2UgSSd2ZQpiZWVuIGJ1c3kgd2l0aCBzb21l
IG1vcmUgdXJnZW50IGZpcmVzIHRoaXMgd2VlazsgSSdsbCByZXdyaXRlCmV2ZXJ5dGhpbmcgdG8g
YmUgZGlyZWN0bHkgdW5kZXIgbWFpbigpIGxhdGVyIHRoaXMgd2Vlay4KCkNoZWVycywKRGFuaWVs
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
