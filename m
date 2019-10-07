Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  7 Oct 2019 09:27:56 +0100
Message-Id: <20191007082756.5963-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Bump conservative threshold for
 ring size
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

V2UgYXJlIHN0aWxsIGhpdHRpbmcgdGhlIG9jY2FzaW9uYWwgc3RhbGwgdXBvbiBzdWJtaXNzaW9u
LCBzbyBiZSBleHRyYQpjYXV0aW9uIGFuZCBsZWF2ZSBvbmUgbW9yZSBzcGFyZS4KClNpZ25lZC1v
ZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIGxpYi9p
OTE1L2dlbV9yaW5nLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2k5MTUvZ2VtX3JpbmcuYyBiL2xpYi9p
OTE1L2dlbV9yaW5nLmMKaW5kZXggMjcyMjY0NjU5Li45ZjA5OWVkZmYgMTAwNjQ0Ci0tLSBhL2xp
Yi9pOTE1L2dlbV9yaW5nLmMKKysrIGIvbGliL2k5MTUvZ2VtX3JpbmcuYwpAQCAtMTA0LDcgKzEw
NCw3IEBAIF9fZ2VtX21lYXN1cmVfcmluZ19pbmZsaWdodChpbnQgZmQsIHVuc2lnbmVkIGludCBl
bmdpbmUsIGVudW0gbWVhc3VyZV9yaW5nX2ZsYWdzCiAJfSB3aGlsZSAoMSk7CiAKIAlpZ3RfYXNz
ZXJ0X2VxKF9fZXhlY2J1ZihmZCwgJmV4ZWNidWYpLCAtRUlOVFIpOwotCWlndF9hc3NlcnQoY291
bnQgPiAxKTsKKwlpZ3RfYXNzZXJ0KGNvdW50ID4gMik7CiAKIAltZW1zZXQoJml0diwgMCwgc2l6
ZW9mKGl0dikpOwogCXNldGl0aW1lcihJVElNRVJfUkVBTCwgJml0diwgTlVMTCk7CkBAIC0xMjAs
NyArMTIwLDcgQEAgX19nZW1fbWVhc3VyZV9yaW5nX2luZmxpZ2h0KGludCBmZCwgdW5zaWduZWQg
aW50IGVuZ2luZSwgZW51bSBtZWFzdXJlX3JpbmdfZmxhZ3MKIAlnZW1fcXVpZXNjZW50X2dwdShm
ZCk7CiAKIAkvKiBCZSBjb25zZXJ2YXRpdmUgaW4gY2FzZSB3ZSBtdXN0IHdyYXAgbGF0ZXIgKi8K
LQlyZXR1cm4gY291bnQgLSAxOworCXJldHVybiBjb3VudCAtIDI7CiB9CiAKIC8qKgotLSAKMi4y
My4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
