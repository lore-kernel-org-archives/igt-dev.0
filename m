Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  8 Jul 2019 10:17:16 +0100
Message-Id: <20190708091716.12252-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_eio: Push the forced reset
 telltales to kmsg
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

TGVhdmUgYSBmZXcgbW9yZSBicmVhZGNydW1icyBpbiB0aGUgZG1lc2cgbG9nIHRvIHRyeSBhbmQg
c3BvdCB3aGVyZSB0aGUKZGVsYXkgb2NjdXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29u
IDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZWlvLmMgfCAz
ICsrLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jIGIvdGVzdHMvaTkxNS9nZW1fZWlvLmMKaW5k
ZXggZGM3YWZiMGZkLi40ZDczNjJkOGYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2Vpby5j
CisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2Vpby5jCkBAIC03MSwxMCArNzEsMTEgQEAgc3RhdGljIHZv
aWQgdHJpZ2dlcl9yZXNldChpbnQgZmQpCiAKIAlpZ3RfbnNlY19lbGFwc2VkKCZ0cyk7CiAKKwlp
Z3Rfa21zZyhLTVNHX0RFQlVHICJGb3JjaW5nIEdQVSByZXNldFxuIik7CiAJaWd0X2ZvcmNlX2dw
dV9yZXNldChmZCk7CiAKIAkvKiBBbmQganVzdCBjaGVjayB0aGUgZ3B1IGlzIGluZGVlZCBydW5u
aW5nIGFnYWluICovCi0JaWd0X2RlYnVnKCJDaGVja2luZyB0aGF0IHRoZSBHUFUgcmVjb3ZlcmVk
XG4iKTsKKwlpZ3Rfa21zZyhLTVNHX0RFQlVHICJDaGVja2luZyB0aGF0IHRoZSBHUFUgcmVjb3Zl
cmVkXG4iKTsKIAlnZW1fdGVzdF9lbmdpbmUoZmQsIEFMTF9FTkdJTkVTKTsKIAlpZ3RfZHJvcF9j
YWNoZXNfc2V0KGZkLCBEUk9QX0FDVElWRSk7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
