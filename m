Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A89E06E0CE
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Feb 2018 09:22:20 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20180228091403.48521-1-maarten.lankhorst@linux.intel.com>
References: <20180228091403.48521-1-maarten.lankhorst@linux.intel.com>
Message-ID: <151980973264.21577.5101436321063249390@mail.alporthouse.com>
Date: Wed, 28 Feb 2018 09:22:12 +0000
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_draw: Fix bo leak in gpu draw
 routines
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
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBNYWFydGVuIExhbmtob3JzdCAoMjAxOC0wMi0yOCAwOToxNDowMykKPiBnZW1faGFu
ZGxlX3RvX2xpYmRybV9ibyBjcmVhdGVzIGEgbmV3IGhhbmRsZSB0aHJvdWdoIHRoZSB1c2Ugb2Yg
ZmxpbmssCj4gd2hpY2ggbWFrZXMga21zX2Zyb250YnVmZmVyX3RyYWNraW5nIHRocm91Z2ggYSBz
aW5nbGUgcnVuIG5vdCBjb21wbGV0ZQo+IHdoZW4gaXQgc3RhcnRzIGxlYWtpbmcgNTBNQiBvYmpl
Y3RzLiBBZGQgdGhlIG1pc3NpbmcgYm9fdW5yZWYgdG8ga2lsbAo+IHRoZSBkdXBsaWNhdGVkIGhh
bmRsZSBhbmQgZml4IHRoZSBsZWFrcyEKPiAKPiBTaWduZWQtb2ZmLWJ5OiBNYWFydGVuIExhbmto
b3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29tPgo+IENjOiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KCjMgZ2VtX2hhbmRsZV90b19saWJkcm1fYm8s
IDMgdW5yZWZzLgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24u
Y28udWs+Ci1DaHJpcwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
