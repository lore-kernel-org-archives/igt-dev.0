Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8E46E3CF
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Nov 2018 17:39:30 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed,  7 Nov 2018 19:39:23 +0200
Message-Id: <20181107173925.12486-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20181107173925.12486-1-ville.syrjala@linux.intel.com>
References: <20181107173925.12486-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_hdmi_inject: Unset all crtcs
 before the test
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
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2hkbWlfaW5q
ZWN0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX2hkbWlfaW5qZWN0LmMgYi90ZXN0cy9rbXNfaGRtaV9pbmplY3QuYwppbmRl
eCA2OTliYWQ1YjczZTIuLmQyNjIwMDAwNjg1MCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2hkbWlf
aW5qZWN0LmMKKysrIGIvdGVzdHMva21zX2hkbWlfaW5qZWN0LmMKQEAgLTI2MCw2ICsyNjAsOCBA
QCBpZ3RfbWFpbgogCiAJCWNvbm5lY3RvciA9IGdldF9jb25uZWN0b3IoZHJtX2ZkLCByZXMpOwog
CQlpZ3RfcmVxdWlyZShjb25uZWN0b3IpOworCisJCWttc3Rlc3RfdW5zZXRfYWxsX2NydGNzKGRy
bV9mZCwgcmVzKTsKIAl9CiAKIAlpZ3Rfc3VidGVzdCgiaW5qZWN0LTRrIikKLS0gCjIuMTguMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
