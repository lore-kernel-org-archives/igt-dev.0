Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E366E6EB
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Nov 2018 10:16:15 +0000 (UTC)
References: <20181030112646.14957-1-maarten.lankhorst@linux.intel.com>
 <20181030133447.GV9144@intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <e29a29c7-5c02-79cf-a1b8-15f171d08864@linux.intel.com>
Date: Fri, 16 Nov 2018 11:16:13 +0100
MIME-Version: 1.0
In-Reply-To: <20181030133447.GV9144@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Only skip when width/x is
 not a multiple of 2.
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
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

T3AgMzAtMTAtMTggb20gMTQ6MzQgc2NocmVlZiBWaWxsZSBTeXJqw6Rsw6Q6Cj4gT24gVHVlLCBP
Y3QgMzAsIDIwMTggYXQgMTI6MjY6NDZQTSArMDEwMCwgTWFhcnRlbiBMYW5raG9yc3Qgd3JvdGU6
Cj4+IFkgYW5kIGhlaWdodCBoYXZlIG5vIHN1Y2ggcmVzdHJpY3Rpb25zLCBzaW5jZSBwaXhlbCBz
aXplIGhhcyBubwo+PiByZWxhdGlvbiB0byBoZWlnaHQuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IE1h
YXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Cj4+IC0t
LQo+PiAgbGliL2lndF9kcmF3LmMgfCA0ICstLS0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2Vy
dGlvbigrKSwgMyBkZWxldGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZHJhdy5j
IGIvbGliL2lndF9kcmF3LmMKPj4gaW5kZXggMDU4MjE0ODBiYzgwLi44NGRkMjEyYzFkYWYgMTAw
NjQ0Cj4+IC0tLSBhL2xpYi9pZ3RfZHJhdy5jCj4+ICsrKyBiL2xpYi9pZ3RfZHJhdy5jCj4+IEBA
IC01ODEsOSArNTgxLDcgQEAgc3RhdGljIHZvaWQgZHJhd19yZWN0X3JlbmRlcihpbnQgZmQsIHN0
cnVjdCBjbWRfZGF0YSAqY21kX2RhdGEsCj4+ICAJICogc21hbGxlciBicHBzIHlvdSB3b24ndCBz
dWNjZWVlZCBpZiB5b3UgbmVlZCB0byBjb3B5ICJoYWxmIiBvZiBhIDMyYnBwCj4+ICAJICogcGl4
ZWwgb3Igc29tZXRoaW5nIHNpbWlsYXIuICovCj4+ICAJaWd0X3NraXBfb24ocmVjdC0+eCAlICgz
MiAvIGJ1Zi0+YnBwKSAhPSAwIHx8Cj4+IC0JCSAgICByZWN0LT55ICUgKDMyIC8gYnVmLT5icHAp
ICE9IDAgfHwKPj4gLQkJICAgIHJlY3QtPncgJSAoMzIgLyBidWYtPmJwcCkgIT0gMCB8fAo+PiAt
CQkgICAgcmVjdC0+aCAlICgzMiAvIGJ1Zi0+YnBwKSAhPSAwKTsKPj4gKwkJICAgIHJlY3QtPncg
JSAoMzIgLyBidWYtPmJwcCkgIT0gMCk7Cj4gUmV2aWV3ZWQtYnk6IFZpbGxlIFN5cmrDpGzDpCA8
dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Cj4KPiBBZGRpbmcgMTZicHAgc3VwcG9ydCB0
byByZW5kZXJjb3B5IHNob3VsZG4ndCBiZSB0b28gaGFyZC4uLgoKClRoYW5rcywgcHVzaGVkLiBX
aWxsIHRha2UgYSBsb29rIGF0IGhvdyB0byBhZGQgaXQgdG8gcmVuZGVyY29weS4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
