Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr0-x242.google.com (mail-wr0-x242.google.com
 [IPv6:2a00:1450:400c:c0c::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA336E48E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Feb 2018 14:36:30 +0000 (UTC)
Received: by mail-wr0-x242.google.com with SMTP id i56so2163639wra.7
 for <igt-dev@lists.freedesktop.org>; Tue, 06 Feb 2018 06:36:30 -0800 (PST)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Tue,  6 Feb 2018 14:36:19 +0000
Message-Id: <20180206143619.25913-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [CI i-g-t] tests/perf_pmu: Raw CPU hotplug
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KCkp1c3Qgb2Zm
bGluZSBhbmQgb25saW5lIENQVXMgdG8gc2VlIHdoYXQgaGFwcGVucy4KClNpZ25lZC1vZmYtYnk6
IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJzdWxpbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvcGVy
Zl9wbXUuYyB8IDMyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hh
bmdlZCwgMzIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL3BlcmZfcG11LmMgYi90
ZXN0cy9wZXJmX3BtdS5jCmluZGV4IGVlZGQ4NzQxNmNmYi4uNjgxZDRhNTVkMDA2IDEwMDY0NAot
LS0gYS90ZXN0cy9wZXJmX3BtdS5jCisrKyBiL3Rlc3RzL3BlcmZfcG11LmMKQEAgLTEwMjcsNiAr
MTAyNywzNSBAQCBzdGF0aWMgdm9pZCBjcHVfaG90cGx1ZyhpbnQgZ2VtX2ZkKQogCWFzc2VydF93
aXRoaW5fZXBzaWxvbih2YWwsIHRzWzFdIC0gdHNbMF0sIHRvbGVyYW5jZSk7CiB9CiAKK3N0YXRp
YyB2b2lkIGNwdV9ob3RwbHVnX3JhdyhpbnQgZ2VtX2ZkKQoreworCWludCBjcHUgPSAwOworCWNo
YXIgbmFtZVsxMjhdOworCWludCBjcHVmZDsKKworCWlndF9yZXF1aXJlKGNwdTBfaG90cGx1Z19z
dXBwb3J0KCkpOworCisJZm9yICg7OykgeworCQlpZ3RfYXNzZXJ0X2x0KHNucHJpbnRmKG5hbWUs
IHNpemVvZihuYW1lKSwKKwkJCQkgICAgICAgIi9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdSVk
L29ubGluZSIsCisJCQkJICAgICAgIGNwdSksCisJCQkgICAgICBzaXplb2YobmFtZSkpOworCQlj
cHVmZCA9IG9wZW4obmFtZSwgT19XUk9OTFkpOworCQlpZiAoY3B1ZmQgPT0gLTEpIHsKKwkJCWln
dF9hc3NlcnQoY3B1ID4gMCk7CisJCQlicmVhazsKKwkJfQorCisJCS8qIE9mZmxpbmUgZm9sbG93
ZWQgYnkgb25saW5lIGEgQ1BVLiAqLworCQlpZ3RfYXNzZXJ0X2VxKHdyaXRlKGNwdWZkLCAiMCIs
IDIpLCAyKTsKKwkJdXNsZWVwKDFlNik7CisJCWlndF9hc3NlcnRfZXEod3JpdGUoY3B1ZmQsICIx
IiwgMiksIDIpOworCisJCWNsb3NlKGNwdWZkKTsKKwkJY3B1Kys7CisJfQorfQorCiBzdGF0aWMg
dm9pZAogdGVzdF9pbnRlcnJ1cHRzKGludCBnZW1fZmQpCiB7CkBAIC0xNTIyLDYgKzE1NTEsOSBA
QCBpZ3RfbWFpbgogCWlndF9zdWJ0ZXN0KCJjcHUtaG90cGx1ZyIpCiAJCWNwdV9ob3RwbHVnKGZk
KTsKIAorCWlndF9zdWJ0ZXN0KCJjcHUtaG90cGx1Zy1yYXciKQorCQljcHVfaG90cGx1Z19yYXco
ZmQpOworCiAJLyoqCiAJICogVGVzdCBHUFUgZnJlcXVlbmN5LgogCSAqLwotLSAKMi4xNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
