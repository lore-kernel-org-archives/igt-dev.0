Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0918F6E086
 for <igt-dev@lists.freedesktop.org>; Mon, 13 Jan 2020 16:07:36 +0000 (UTC)
MIME-Version: 1.0
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <20200113091908.11983-5-zbigniew.kempczynski@intel.com>
References: <20200113091908.11983-1-zbigniew.kempczynski@intel.com>
 <20200113091908.11983-5-zbigniew.kempczynski@intel.com>
Message-ID: <157893163936.27314.8748595118150843253@skylake-alporthouse-com>
Date: Mon, 13 Jan 2020 16:07:19 +0000
Subject: Re: [igt-dev] [PATCH i-g-t v7 4/5] i915/gem_render_copy.c: Simplify
 code by switch to rendercopy bufmgr
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
To: =?utf-8?q?Zbigniew_Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

UXVvdGluZyBaYmlnbmlldyBLZW1wY3p5xYRza2kgKDIwMjAtMDEtMTMgMDk6MTk6MDcpCj4gQEAg
LTIwOSwxMyArOTQsMTMgQEAgY29weV9mcm9tX2xpbmVhcl9idWYoZGF0YV90ICpkYXRhLCBzdHJ1
Y3QgaWd0X2J1ZiAqc3JjLCBzdHJ1Y3QgaWd0X2J1ZiAqZHN0KQo+ICAKPiAgICAgICAgIGdlbV9z
ZXRfZG9tYWluKGRhdGEtPmRybV9mZCwgc3JjLT5iby0+aGFuZGxlLAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgSTkxNV9HRU1fRE9NQUlOX0NQVSwgMCk7Cj4gLSAgICAgICBsaW5lYXIgPSBnZW1f
bW1hcF9fY3B1KGRhdGEtPmRybV9mZCwgc3JjLT5iby0+aGFuZGxlLCAwLAo+IC0gICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzcmMtPmJvLT5zaXplLCBQUk9UX1JFQUQpOwo+ICsgICAgICAg
bGluZWFyID0gX19nZW1fbW1hcF9vZmZzZXRfX2NwdShkYXRhLT5kcm1fZmQsIHNyYy0+Ym8tPmhh
bmRsZSwgMCwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3JjLT5i
by0+c2l6ZSwgUFJPVF9SRUFEKTsKPiArICAgICAgIGlmICghbGluZWFyKQo+ICsgICAgICAgICAg
ICAgICBsaW5lYXIgPSBnZW1fbW1hcF9fY3B1KGRhdGEtPmRybV9mZCwgc3JjLT5iby0+aGFuZGxl
LCAwLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNyYy0+Ym8tPnNp
emUsIFBST1RfUkVBRCk7CgpUaGVyZSdzIGFuIGFyZ3VtZW50IGhlcmUgZm9yCmdlbV9tbWFwX19j
YWNoZV9jb2hlcmVudCgpIG9yIChnZW1fbW1hcF9fY3B1X2NvaGVyZW50KQoKV2UgbWF5IHdhbnQg
c29tZXRoaW5nIGxpa2U6CgpsaW5lYXIgPSBnZW1fbW1hcF9fY2FjaGVfY29oZXJlbnQoKTsKaWYg
KCFsaW5lYXIpIHsKCWxpbmVhciA9IGdlbV9tbWFwX19kZXZpY2VfY29oZXJlbnQoKTsKCWZvcl9l
YWNoX3BhZ2UobGluZWFyKSB7CgkJaWd0X21lbWNweV9mcm9tX3djKHRtcCwgbGluZWFyICsgcGFn
ZSwgUEFHRV9TSVpFKTsKCQljb3B5X2xpbmVhcl90b195dChkYXRhLCBkc3QgKyBwYWdlLCB0bXAp
OwoJfQp9CgpGb3IgY29tcGxldGUgYmVsdCBhbmQgYnJhY2VzLgotQ2hyaXMKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
