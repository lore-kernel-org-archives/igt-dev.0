Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 11 Feb 2019 17:52:42 +0000
Message-Id: <20190211175242.722-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/gem_exec_reuse: stop the hang detector
 afterwards
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGFrZSByZXNwb25zaWJpbGl0eSBmb3IgdGhlIHN0YXRlIHdlIGNyZWF0ZSwgYW5kIGluIHBhcnRp
Y3VsYXIgcmVtZW1iZXIKdG8ga2lsbCBvdXIgY2hpbGQgcHJvY2VzcyAodGhlIGhhbmcgZGV0ZWN0
b3IpIGJlZm9yZSBleGl0aW5nLgoKUmVwb3J0ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+ClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgpDYzogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
LS0tCiB0ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNlLmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkx
NS9nZW1fZXhlY19yZXVzZS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jCmluZGV4IGRm
MjIwYmU3Yi4uNDQ5NDY1MjhmIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX3JldXNl
LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19yZXVzZS5jCkBAIC0xMTYsNyArMTE2LDcgQEAg
c3RhdGljIHVuc2lnbmVkIGludCBtYXhfbmZkKHZvaWQpCiAKIGlndF9tYWluCiB7Ci0Jc3RydWN0
IG5vb3Agbm87CisJc3RydWN0IG5vb3Agbm8gPSB7IC5mZCA9IC0xIH07CiAJdW5zaWduZWQgZW5n
aW5lc1sxNl07CiAJdW5zaWduZWQgbmVuZ2luZTsKIAl1bnNpZ25lZCBuOwpAQCAtMjEzLDQgKzIx
Myw3IEBAIGlndF9tYWluCiAJCWZvciAobiA9IDA7IG4gPCBuY29udGV4dHM7IG4rKykKIAkJCWdl
bV9jb250ZXh0X2Rlc3Ryb3kobm8uZmQsIGNvbnRleHRzW25dKTsKIAl9CisKKwlpZ3RfZml4dHVy
ZQorCQlpZ3Rfc3RvcF9oYW5nX2RldGVjdG9yKG5vLmZkKTsKIH0KLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
