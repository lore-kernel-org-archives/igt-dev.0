Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D736E3CD
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Nov 2018 17:39:28 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed,  7 Nov 2018 19:39:22 +0200
Message-Id: <20181107173925.12486-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_3d: Unset all crtcs before
 the test
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk9u
IHByZS1IU1cgd2UgaGF2ZSBzZXBhcmF0ZSBlbmNvZGVycyBmb3IgdGhlIERQIGFuZCBIRE1JIHBv
cnRzLApidXQgYm90aCBjYW4ndCBiZSBlbmFibGVkIGF0IHRoZSBzYW1lIHRpbWUuIFRoZSB0ZXN0
IGZhaWxzIHRvCmFjY291bnQgZm9yIHRoYXQgYW5kIGNhbiB0aHVzIGZhaWwgd2hlbiB0aGUga2Vy
bmVsIHJlamVjdHMKdGhlIG1vZGVzZXQuIFdlIGNhbiBhdm9pZCB0aGF0IGJ5IHR1cm5pbmcgb2Zm
IGFsbCB0aGUgcG9ydHMKYmVmb3JlaGFuZC4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zXzNkLmMgfCAy
ICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
a21zXzNkLmMgYi90ZXN0cy9rbXNfM2QuYwppbmRleCBkZjgxODVhYmViYzQuLjVhZWI1ZGQxMWU2
YiAxMDA2NDQKLS0tIGEvdGVzdHMva21zXzNkLmMKKysrIGIvdGVzdHMva21zXzNkLmMKQEAgLTU3
LDYgKzU3LDggQEAgaWd0X3NpbXBsZV9tYWluCiAJfQogCWlndF9yZXF1aXJlKGNvbm5lY3Rvcik7
CiAKKwlrbXN0ZXN0X3Vuc2V0X2FsbF9jcnRjcyhkcm1fZmQsIHJlcyk7CisKIAlrbXN0ZXN0X2Vk
aWRfYWRkXzNkKGlndF9rbXNfZ2V0X2Jhc2VfZWRpZCgpLCBFRElEX0xFTkdUSCwgJmVkaWQsCiAJ
CQkgICAgJmxlbmd0aCk7CiAKLS0gCjIuMTguMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2Cg==
