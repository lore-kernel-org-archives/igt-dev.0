Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F8928924F
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 12:58:00 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id x7so19762798eds.8
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 04:58:00 -0800 (PST)
Date: Wed, 20 Feb 2019 13:57:56 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190220125756.GZ2665@phenom.ffwll.local>
References: <20190219075716.11553-1-daniel.vetter@ffwll.ch>
 <20190219075716.11553-5-daniel.vetter@ffwll.ch>
 <20190220112227.ykrhqp6lgqucfs2y@ahiler-desk1.fi.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190220112227.ykrhqp6lgqucfs2y@ahiler-desk1.fi.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 5/5] lib/tests: Add testcase for
 nonexisting subtest name
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
Cc: IGT development <igt-dev@lists.freedesktop.org>, Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

T24gV2VkLCBGZWIgMjAsIDIwMTkgYXQgMDE6MjI6MjdQTSArMDIwMCwgQXJrYWRpdXN6IEhpbGVy
IHdyb3RlOgo+IE9uIFR1ZSwgRmViIDE5LCAyMDE5IGF0IDA4OjU3OjE2QU0gKzAxMDAsIERhbmll
bCBWZXR0ZXIgd3JvdGU6Cj4gPiBXaGlsZSBhdCBpdCwgY29udmVydCB0aGUgZXhpc3RpbmcgdGVz
dGNhc2UgZm9yIGludmFsaWQgc3VidGVzdCBuYW1lcwo+ID4gdG8gYSBwb3NpdGl2ZSBvbmUuCj4g
PiAKPiA+IFRoaXMgaXMgdGhlIG9ubHkgdGhpbmcgdGhlIGludmFsaWQgc3VidGVzdCBjaGVja2lu
ZyBmb3IgYWxsIHRlc3RzIGRpZAo+ID4gY292ZXIsIHdoaWNoIHdhc24ndCBjb3ZlcmVkIHRocm91
Z2ggc29tZSBvdGhlciBjaGVja3MgYWxyZWFkeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogRGFu
aWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+Cj4gPiAtLS0KPiA+ICBsaWIvdGVz
dHMvaWd0X2ludmFsaWRfc3VidGVzdF9uYW1lLmMgfCA2MiArKysrKysrKysrKysrKysrKysrKysr
KysrKystCj4gPiAgbGliL3Rlc3RzL21lc29uLmJ1aWxkICAgICAgICAgICAgICAgIHwgIDIgKy0K
PiA+ICAyIGZpbGVzIGNoYW5nZWQsIDYyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
PiAKPiA+IGRpZmYgLS1naXQgYS9saWIvdGVzdHMvaWd0X2ludmFsaWRfc3VidGVzdF9uYW1lLmMg
Yi9saWIvdGVzdHMvaWd0X2ludmFsaWRfc3VidGVzdF9uYW1lLmMKPiA+IGluZGV4IDQxODA3MWRh
MDU5MS4uZjk2MmUwZGYwMTIxIDEwMDY0NAo+ID4gLS0tIGEvbGliL3Rlc3RzL2lndF9pbnZhbGlk
X3N1YnRlc3RfbmFtZS5jCj4gPiArKysgYi9saWIvdGVzdHMvaWd0X2ludmFsaWRfc3VidGVzdF9u
YW1lLmMKPiA+IEBAIC0yMSwxMSArMjEsNzEgQEAKPiA+ICAgKiBJTiBUSEUgU09GVFdBUkUuCj4g
PiAgICovCj4gPiAgCj4gPiArI2luY2x1ZGUgPGVycm5vLmg+Cj4gPiArI2luY2x1ZGUgPHN5cy93
YWl0Lmg+Cj4gPiArCj4gPiAgI2luY2x1ZGUgImlndF9jb3JlLmgiCj4gPiAgCj4gPiAtaWd0X21h
aW4KPiA+ICsjaW5jbHVkZSAiaWd0X3Rlc3RzX2NvbW1vbi5oIgo+ID4gKwo+ID4gK3N0YXRpYyB2
b2lkIGludmFsaWRfc3VidGVzdF9uYW1lKHZvaWQpCj4gPiAgewo+ID4gKwljaGFyIHByb2dbXSA9
ICJpZ3Rfbm9fZXhpdCI7Cj4gPiArCWNoYXIgKmZha2VfYXJndltdID0ge3Byb2d9Owo+ID4gKwlp
bnQgZmFrZV9hcmdjID0gMTsKPiAKPiBTYW1lIHRoaW5nIHdpdGggQVJSQVlfU0laRSBhcyBpbiA0
LzUsIGJ1dCB0aGF0IGluIHRob3NlIHRyaXZpYWwgY2FzZXMKPiBpdCdzIGp1c3Qgc3VnYXIuCgpU
aGVyZSdzIG1vcmUgdGhhbiB0aGVzZSB0d28gaW4gbGliL3Rlc3RzLCBJJ2xsIGRvIGEgZm9sbG93
LXVwIHBhdGNoLgoKPiBSZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGls
ZXJAaW50ZWwuY29tPgoKVGhhbmtzIGZvciB5b3VyIGFuZCBDaHJpcycgcmV2aWV3cywgc2VyaWVz
IG1lcmdlZC4KLURhbmllbAoKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIElu
dGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
