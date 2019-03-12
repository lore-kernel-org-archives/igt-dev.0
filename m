Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B03C56E02F
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Mar 2019 21:58:04 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Tue, 12 Mar 2019 14:57:35 -0700
Message-Id: <20190312215738.5598-2-antonio.argenziano@intel.com>
In-Reply-To: <20190312215738.5598-1-antonio.argenziano@intel.com>
References: <20190312215738.5598-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 1/4] tests/i915/gem_mmap_gtt: Add invalid parameters
 test
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
List-ID: <igt-dev@lists.freedesktop.org>

QWRkIGEgdGVzdCBmb3IgYW4gaW52YWxpZCBoYW5kbGUgYmVpbmcgcGFzc2VkIHRvIHRoZSBJT0NU
TC4KClNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnppYW5v
QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jIHwgMTIgKysrKysrKysr
KysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2k5MTUvZ2VtX21tYXBfZ3R0LmMgYi90ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jCmluZGV4IGY2
ZmJiZTE5Li41OGY3NDAzYyAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9ndHQuYwor
KysgYi90ZXN0cy9pOTE1L2dlbV9tbWFwX2d0dC5jCkBAIC04MzEsNiArODMxLDE4IEBAIGlndF9t
YWluCiAJaWd0X2ZpeHR1cmUKIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsK
IAorCWlndF9zdWJ0ZXN0KCJiYWQtb2JqZWN0IikgeworCQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX21t
YXAgYXJnOworCQlpbnQgcmV0OworCisJCW1lbXNldCgmYXJnLCAwLCBzaXplb2YoYXJnKSk7CisJ
CWFyZy5oYW5kbGUgPSAweDEwMTAxMDEwOworCQlhcmcub2Zmc2V0ID0gMDsKKwkJYXJnLnNpemUg
PSA0MDk2OworCQlyZXQgPSBpb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VNX01NQVBfR1RULCAm
YXJnKTsKKwkJaWd0X2Fzc2VydChyZXQgPT0gLTEgJiYgZXJybm8gPT0gRU5PRU5UKTsKKwl9CisK
IAlpZ3Rfc3VidGVzdCgiYmFzaWMiKQogCQl0ZXN0X2FjY2VzcyhmZCk7CiAJaWd0X3N1YnRlc3Qo
ImJhc2ljLXNob3J0IikKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
