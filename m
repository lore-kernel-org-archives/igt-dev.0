Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 10 Jun 2019 11:46:54 +0100
Message-Id: <20190610104654.20130-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_ctx_engines: Skip trying to read a
 non-existent TIMESTAMP
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhlIHBlci1lbmdpbmUgVElNRVNUQU1QIChhdCBsZWFzdCBhdCB0aGUgb2Zmc2V0IEkga25vdyBh
Ym91dCkgb25seSBjYW1lCmludG8gYmVpbmcgd2l0aCBnZW42LiBTbyBza2lwIHRoZSB0ZXN0IG9u
IG9sZGVyIGdlbiBhcyB0aGUgcmVzdWx0cyBhcmUKZ2FyYmFnZS4KCkJ1Z3ppbGxhOiBodHRwczov
L2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMTA4NzQKU2lnbmVkLW9mZi1i
eTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkx
NS9nZW1fY3R4X2VuZ2luZXMuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9jdHhfZW5naW5lcy5jIGIvdGVzdHMvaTkx
NS9nZW1fY3R4X2VuZ2luZXMuYwppbmRleCAzOGVhMzRkMjEuLjNlY2FkZTQxNyAxMDA2NDQKLS0t
IGEvdGVzdHMvaTkxNS9nZW1fY3R4X2VuZ2luZXMuYworKysgYi90ZXN0cy9pOTE1L2dlbV9jdHhf
ZW5naW5lcy5jCkBAIC00MTksNiArNDE5LDggQEAgc3RhdGljIHZvaWQgaW5kZXBlbmRlbnQoaW50
IGk5MTUpCiAJaW50IHRpbWVsaW5lID0gc3dfc3luY190aW1lbGluZV9jcmVhdGUoKTsKIAl1aW50
MzJfdCBsYXN0LCAqbWFwOwogCisJaWd0X3JlcXVpcmUoZ2VuID49IDYpOyAvKiBObyBwZXItZW5n
aW5lIFRJTUVTVEFNUCBvbiBvbGRlciBnZW4gKi8KKwogCXsKIAkJc3RydWN0IGRybV9pOTE1X2dl
bV9leGVjYnVmZmVyMiBleGVjYnVmID0gewogCQkJLmJ1ZmZlcnNfcHRyID0gdG9fdXNlcl9wb2lu
dGVyKCZyZXN1bHRzKSwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
