Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 28 Jan 2019 10:14:15 +0000
Message-Id: <20190128101415.21163-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] i915/perf_pmu: Check for hangs allowed
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
Cc: igt-dev@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q2hlY2sgd2UgY2FuIHJlc2V0IHRoZSBHUFUgYmVmb3JlIHJ1bm5pbmcgdGhlIHJlc2V0IHRlc3Qu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
Q2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMv
cGVyZl9wbXUuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9wZXJmX3BtdS5jIGIvdGVzdHMvcGVy
Zl9wbXUuYwppbmRleCAyMTI5MmJmM2EuLjFmZGJjYzE1NCAxMDA2NDQKLS0tIGEvdGVzdHMvcGVy
Zl9wbXUuYworKysgYi90ZXN0cy9wZXJmX3BtdS5jCkBAIC0xODEyLDggKzE4MTIsMTQgQEAgaWd0
X21haW4KIAkJCQkJYWNjdXJhY3koZmQsIGUsIHBjdFtpXSwgMTApOwogCQkJfQogCi0JCQlpZ3Rf
c3VidGVzdF9mKCJidXN5LWhhbmctJXMiLCBlLT5uYW1lKQorCQkJaWd0X3N1YnRlc3RfZigiYnVz
eS1oYW5nLSVzIiwgZS0+bmFtZSkgeworCQkJCWlndF9oYW5nX3QgaGFuZyA9CisJCQkJCWlndF9h
bGxvd19oYW5nKGZkLCAwLCBlMnJpbmcoZmQsIGUpKTsKKwogCQkJCXNpbmdsZShmZCwgZSwgVEVT
VF9CVVNZIHwgRkxBR19IQU5HKTsKKworCQkJCWlndF9kaXNhbGxvd19oYW5nKGZkLCBoYW5nKTsK
KwkJCX0KIAkJfQogCiAJCS8qKgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
