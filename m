Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EDD46EE9A
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 19:26:23 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180719191614.14525-1-lucas.demarchi@intel.com>
References: <20180713085317.GC3008@phenom.ffwll.local>
 <20180719191614.14525-1-lucas.demarchi@intel.com>
Message-ID: <153202837161.4229.6874421809295761690@skylake-alporthouse-com>
Date: Thu, 19 Jul 2018 20:26:11 +0100
Subject: Re: [igt-dev] [PATCH i-g-t v2] Follow kernel's resource streamer
 removal
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
To: Lucas De Marchi <lucas.demarchi@intel.com>, igt-dev@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBMdWNhcyBEZSBNYXJjaGkgKDIwMTgtMDctMTkgMjA6MTY6MTQpCj4gUmVzb3VyY2Ug
c3RyZWFtZXIgaXMgYmVpbmcgcmVtb3ZlZCBmcm9tIGFsbCBHRU5zLCBzbyBqdXN0IHRlc3QgaXQK
PiByZXR1cm5zIEVJTlZBTCBmb3IgYWxsIEdFTnMgd2hlbiBhIGJhdGNoIGlzIHN1Ym1pdHRlZCB3
aXRoCj4gSTkxNV9FWEVDX1JFU09VUkNFX1NUUkVBTUVSIGtlZXBpbmcgb25lIHRlc3QgcGVyIHJp
bmcuCj4gCj4gdjI6IGxldCBvbmUgdGVzdCBwZXIgcmluZyByYXRoZXIgdGhhbiBqdXN0IG9uZSB0
ZXN0Cj4gCj4gU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1hcmNoaUBp
bnRlbC5jb20+Cj4gLS0tCj4gCj4gVGhpcyByZXF1aXJlcyB0aGUgcGF0Y2ggZm9yIHRoZSBrZXJu
ZWwgcmVtb3ZpbmcgUlMgZnJvbSBhbGwgZ2Vucy4KPiAKPiAgdGVzdHMvZ2VtX2V4ZWNfcGFyYW1z
LmMgfCA2ICstLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRp
b25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbV9leGVjX3BhcmFtcy5jIGIvdGVzdHMv
Z2VtX2V4ZWNfcGFyYW1zLmMKPiBpbmRleCAwNGMyMWMwNS4uZjgyMjI5N2YgMTAwNjQ0Cj4gLS0t
IGEvdGVzdHMvZ2VtX2V4ZWNfcGFyYW1zLmMKPiArKysgYi90ZXN0cy9nZW1fZXhlY19wYXJhbXMu
Ywo+IEBAIC0zNzUsMjUgKzM3NSwyMSBAQCBpZ3RfbWFpbgo+ICAgICAgICAgfQo+ICAKPiAgICAg
ICAgIGlndF9zdWJ0ZXN0KCJycy1pbnZhbGlkLW9uLWJzZC1yaW5nIikgewo+IC0gICAgICAgICAg
ICAgICBpZ3RfcmVxdWlyZShJU19IQVNXRUxMKGRldmlkKSB8fCBpbnRlbF9nZW4oZGV2aWQpID49
IDgpOwoKTm93IGZhaWxzIG9uIG9sZCBrZXJuZWxzLi4uCgppZ3Rfc3VidGVzdCgicnMtaW52YWxp
ZCIpIHsKCWludCBoYXNfcnMgPSBnZW1fcGFyYW0oSEFTX1JFU09VUkNFX1NUUkVBTUVSKTsKCWZv
cl9lYWNoX2VuZ2luZShmZCwgcmluZykgewoJCWludCBleHBlY3QgPSAtRUlOVkFMOwoJCWlmICho
YXNfcnMgJiYgKHJpbmcgPT0gMCB8fCByaW5nID09IEk5MTVfRVhFQ19SRU5ERVIpKQoJCQlleHBl
Y3QgPSAwOwoKCQlleGVjYnVmLmZsYWdzID0gZW5naW5lOwoJCWlndF9hc3NlcnRfZXEoX19nZW1f
ZXhlY2J1ZihmZCwgJmV4ZWNidWYpLCBleHBlY3QpOwoJfQp9CgpOb3cgaWYgd2UgcmVpbnRlcnBy
ZXQgdGhlIHBhcmFtIGFzIHRoZSB1YWJpLWNsYXNzIGJpdG1hc2suLi4KLUNocmlzCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
