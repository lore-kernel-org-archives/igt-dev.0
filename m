Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BD76EFCD
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:04 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:46 +0200
Message-Id: <20190116112050.27647-18-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 17/21] lib/igt_core: Handle all failures to
 read .igtrc
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UGFyc2UgZXJyb3IgaXMgbm90IHRoZSBvbmx5IHdheSB0byBmYWlsIGxvYWRpbmcgdGhlIGZpbGUu
IEEgY29tbW9uCm90aGVyIGVycm9yIGlzIHRoZSBmaWxlIG5vdCBleGlzdGluZy4gSGFuZGxlIGFs
bCBmYWlsdXJlcyB0byByZWFkCi5pZ3RyYyBieSByZWxlYXNpbmcgdGhlIGtleSBzdG9yZSBpbW1l
ZGlhdGVseS4KClNpZ25lZC1vZmYtYnk6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50
ZWwuY29tPgpDYzogUGF1bCBLb2NpYWxrb3dza2kgPHBhdWwua29jaWFsa293c2tpQGJvb3RsaW4u
Y29tPgpDYzogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0K
IGxpYi9pZ3RfY29yZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9jb3JlLmMgYi9saWIvaWd0X2NvcmUu
YwppbmRleCAyNmRkMjc4OS4uMGNhZTliNmEgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfY29yZS5jCisr
KyBiL2xpYi9pZ3RfY29yZS5jCkBAIC01OTEsNyArNTkxLDcgQEAgc3RhdGljIHZvaWQgY29tbW9u
X2luaXRfY29uZmlnKHZvaWQpCiAJaWd0X2tleV9maWxlID0gZ19rZXlfZmlsZV9uZXcoKTsKIAly
ZXQgPSBnX2tleV9maWxlX2xvYWRfZnJvbV9maWxlKGlndF9rZXlfZmlsZSwga2V5X2ZpbGVfbG9j
LAogCQkJCQlHX0tFWV9GSUxFX05PTkUsICZlcnJvcik7Ci0JaWYgKGVycm9yICYmIGVycm9yLT5j
b2RlID09IEdfS0VZX0ZJTEVfRVJST1IpIHsKKwlpZiAoIXJldCkgewogCQlnX2Vycm9yX2ZyZWUo
ZXJyb3IpOwogCQlnX2tleV9maWxlX2ZyZWUoaWd0X2tleV9maWxlKTsKIAkJaWd0X2tleV9maWxl
ID0gTlVMTDsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
