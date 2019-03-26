Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DC7B89359
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Mar 2019 13:28:17 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 Mar 2019 13:28:01 +0000
Message-Id: <20190326132801.5216-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tools/intel-gpu-top: Only link against
 igt_perf.la
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
To: igt-dev@lists.freedesktop.org
Cc: Eero Tamminen <eero.t.tamminen@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Rml4IHRoZSBtZXNvbiBidWlsZCB0byBub3QgbGluayBpbnRlbC1ncHUtdG9wIGFnYWluc3R0IHRo
ZSB3aG9sZSB0ZXN0CmluZnJhc3RydWN0dXJlOyBpdCdzIGEgdG9vbCBub3QgYSB0ZXN0IQoKUmVw
b3J0ZWQtYnk6IEVlcm8gVGFtbWluZW4gPGVlcm8udC50YW1taW5lbkBpbnRlbC5jb20+CkJ1Z3pp
bGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTAyNDkK
U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CkNj
OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIHRvb2xzL21l
c29uLmJ1aWxkIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvbWVzb24uYnVpbGQgYi90b29scy9tZXNvbi5idWls
ZAppbmRleCA3OWYzNmFhOTUuLjVkMDBmMmUzYyAxMDA2NDQKLS0tIGEvdG9vbHMvbWVzb24uYnVp
bGQKKysrIGIvdG9vbHMvbWVzb24uYnVpbGQKQEAgLTk4LDcgKzk4LDcgQEAgc2hhcmVkX2xpYnJh
cnkoJ2ludGVsX2F1YmR1bXAnLCAnYXViZHVtcC5jJywKIGV4ZWN1dGFibGUoJ2ludGVsX2dwdV90
b3AnLCAnaW50ZWxfZ3B1X3RvcC5jJywKIAkgICBpbnN0YWxsIDogdHJ1ZSwKIAkgICBpbnN0YWxs
X3JwYXRoIDogYmluZGlyX3JwYXRoZGlyLAotCSAgIGRlcGVuZGVuY2llcyA6IHRvb2xfZGVwcyAr
IFsgbGliX2lndF9wZXJmIF0pCisJICAgZGVwZW5kZW5jaWVzIDogbGliX2lndF9wZXJmKQogCiBj
b25mX2RhdGEgPSBjb25maWd1cmF0aW9uX2RhdGEoKQogY29uZl9kYXRhLnNldCgncHJlZml4Jywg
cHJlZml4KQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
