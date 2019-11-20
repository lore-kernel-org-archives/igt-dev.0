Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8378C6EA40
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Nov 2019 21:49:08 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
References: <20191120212143.364333-1-lionel.g.landwerlin@intel.com>
 <20191120212143.364333-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20191120212143.364333-2-lionel.g.landwerlin@intel.com>
Message-ID: <157428654365.24852.3259228513523199248@skylake-alporthouse-com>
Date: Wed, 20 Nov 2019 21:49:03 +0000
Subject: Re: [igt-dev] [PATCH i-g-t 01/10] lib/syncobj: drop local
 declarations
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
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMaW9uZWwgTGFuZHdlcmxpbiAoMjAxOS0xMS0yMCAyMToyMTozNCkKPiBXZSBoYXZl
IGNvcGllcyBvZiB0aGUgRFJNIHVBUEkgaGVhZGVycyBpbiB0aGUgcmVwbywgc28gZHJvcCB0aGUg
bG9jYWwKPiBkZWNsYXJhdGlvbiBvZiBzeW5jb2JqIGRlZmluZXMvdHlwZXMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGlvbmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29t
Pgo+IC0tLQo+ICBsaWIvaWd0X3N5bmNvYmouYyAgICAgfCAxNiArKysrKystLS0tLS0KPiAgbGli
L2lndF9zeW5jb2JqLmggICAgIHwgMjYgKy0tLS0tLS0tLS0tLS0tLS0tLQo+ICB0ZXN0cy9zeW5j
b2JqX2Jhc2ljLmMgfCAgMiArLQo+ICB0ZXN0cy9zeW5jb2JqX3dhaXQuYyAgfCA1OCArKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDQgZmlsZXMgY2hhbmdlZCwg
MzkgaW5zZXJ0aW9ucygrKSwgNjMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2xpYi9p
Z3Rfc3luY29iai5jIGIvbGliL2lndF9zeW5jb2JqLmMKPiBpbmRleCAwZmRkYjk3YS4uZTU1Njlm
ZmMgMTAwNjQ0Cj4gLS0tIGEvbGliL2lndF9zeW5jb2JqLmMKPiArKysgYi9saWIvaWd0X3N5bmNv
YmouYwo+IEBAIC0xNzAsMTAgKzE3MCwxMCBAQCBzeW5jb2JqX2ltcG9ydF9zeW5jX2ZpbGUoaW50
IGZkLCB1aW50MzJfdCBoYW5kbGUsIGludCBzeW5jX2ZpbGUpCj4gIH0KPiAgCj4gIGludAo+IC1f
X3N5bmNvYmpfd2FpdChpbnQgZmQsIHN0cnVjdCBsb2NhbF9zeW5jb2JqX3dhaXQgKmFyZ3MpCj4g
K19fc3luY29ial93YWl0KGludCBmZCwgc3RydWN0IGRybV9zeW5jb2JqX3dhaXQgKmFyZ3MpCj4g
IHsKPiAgICAgICAgIGludCBlcnIgPSAwOwo+IC0gICAgICAgaWYgKGRybUlvY3RsKGZkLCBMT0NB
TF9JT0NUTF9TWU5DT0JKX1dBSVQsIGFyZ3MpKQo+ICsgICAgICAgaWYgKGRybUlvY3RsKGZkLCBE
Uk1fSU9DVExfU1lOQ09CSl9XQUlULCBhcmdzKSkKCnMvZHJtSW9jdGwvaWd0X2lvY3RsLyBhcyB3
ZWxsLCBqdXN0IGluIGNhc2Ugd2UgZXZlciB3YW50IHRvIGRvIHNpZ25hbAppbmplY3Rpb24gb3Ig
bWVhc3VyZSBsYXRlbmNpZXMuCgo+ICAgICAgICAgICAgICAgICBlcnIgPSAtZXJybm87CgpXaGVu
IHdlIHJldHVybiBlcnIsIGNsZWFyIGVycm5vIC0tIGl0IGp1c3QgbXVkZGllcyB1cCB0aGUgaWd0
X2Fzc2VydCgpCmlmIHdlIGFscmVhZHkga25vdyBpdC4KClJldmlld2VkLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLUNocmlzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
