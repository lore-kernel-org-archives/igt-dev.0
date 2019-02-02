Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Sat,  2 Feb 2019 22:36:30 +0000
Message-Id: <20190202223630.15471-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Add trailing '\n' to an
 igt_assert_f
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

QSBtaXNzaW5nIG5ld2xpbmUgYXQgdGhlIGVuZCBvZiBhbiBhc3NlcnQsIHNvIGFkZCBpdCBmb3Ig
Y2xhcml0eSBpbiB0aGUKZXJyb3IgbWVzc2FnZS4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvcGVyZl9wbXUuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2k5MTUvcGVyZl9wbXUuYyBiL3Rlc3RzL2k5MTUvcGVyZl9wbXUuYwpp
bmRleCAzOTEzNzgxMzkuLmMzOTkzYzQxNyAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9wZXJmX3Bt
dS5jCisrKyBiL3Rlc3RzL2k5MTUvcGVyZl9wbXUuYwpAQCAtNzA3LDcgKzcwNyw3IEBAIHNlbWFf
d2FpdChpbnQgZ2VtX2ZkLCBjb25zdCBzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmUs
CiAJfSB3aGlsZSAoIW9ial9wdHJbMV0pOwogCiAJaWd0X2Fzc2VydF9mKGlndF93YWl0KHBtdV9y
ZWFkX3NpbmdsZShmZCkgIT0gdmFsWzBdLCAxMCwgMSksCi0JCSAgICAgInNhbXBsaW5nIGZhaWxl
ZCB0byBzdGFydCB3aXRoaW5nIDEwbXMiKTsKKwkJICAgICAic2FtcGxpbmcgZmFpbGVkIHRvIHN0
YXJ0IHdpdGhpbmcgMTBtc1xuIik7CiAKIAl2YWxbMF0gPSBfX3BtdV9yZWFkX3NpbmdsZShmZCwg
JnRzWzBdKTsKIAlzbGVwdCA9IG1lYXN1cmVkX3VzbGVlcChiYXRjaF9kdXJhdGlvbl9ucyAvIDEw
MDApOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
