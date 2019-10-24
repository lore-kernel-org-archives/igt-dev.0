Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D973A6E287
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Oct 2019 11:05:57 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 24 Oct 2019 14:05:46 +0300
Message-Id: <20191024110546.25569-9-petri.latvala@intel.com>
In-Reply-To: <20191024110546.25569-1-petri.latvala@intel.com>
References: <20191024110546.25569-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 8/8] i915/gem_exec_basic: Use dynamic
 subtests
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

SW5zdGVhZCBvZiBnZW5lcmF0aW5nIGEgc3VidGVzdCBmb3IgZWFjaCBlbmdpbmUgaW4gYSBzdGF0
aWMgbGlzdCwKY29udmVydCB0byBkeW5hbWljIHN1YnRlc3RzLCB3aXRoIG9uZSBkeW5hbWljIHN1
YnRlc3QgcGVyIGFjdHVhbGx5CnByZXNlbnQgcGh5c2ljYWwgZW5naW5lLgoKU2lnbmVkLW9mZi1i
eTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkx
NS9nZW1fZXhlY19iYXNpYy5jIHwgMjYgKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmFzaWMu
YwppbmRleCAxMjg3ODYwYi4uYjJkNmRkYzIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2V4
ZWNfYmFzaWMuYworKysgYi90ZXN0cy9pOTE1L2dlbV9leGVjX2Jhc2ljLmMKQEAgLTE1OSwxMyAr
MTU5LDI1IEBAIGlndF9tYWluCiAJaWd0X3N1YnRlc3QoImd0dC1hbGwiKQogCQlndHRfYWxsKGZk
KTsKIAotCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7Ci0JCWlndF9zdWJ0ZXN0
X2YoImJhc2ljLSVzIiwgZS0+bmFtZSkKLQkJCW5vb3AoZmQsIGUtPmZsYWdzKTsKLQkJaWd0X3N1
YnRlc3RfZigicmVhZG9ubHktJXMiLCBlLT5uYW1lKQotCQkJcmVhZG9ubHkoZmQsIGUtPmZsYWdz
KTsKLQkJaWd0X3N1YnRlc3RfZigiZ3R0LSVzIiwgZS0+bmFtZSkKLQkJCWd0dChmZCwgZS0+Zmxh
Z3MpOworCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19zdWJzdWJ0ZXN0cygiYmFzaWMiKSB7CisJ
CV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGZkLCBlKSB7CisJCQlpZ3RfZHluYW1pY19zdWJz
dWJ0ZXN0X2YoIiVzIiwgZS0+bmFtZSkKKwkJCQlub29wKGZkLCBlLT5mbGFncyk7CisJCX0KKwl9
CisKKwlpZ3Rfc3VidGVzdF93aXRoX2R5bmFtaWNfc3Vic3VidGVzdHMoInJlYWRvbmx5Iikgewor
CQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgeworCQkJaWd0X2R5bmFtaWNfc3Vi
c3VidGVzdF9mKCIlcyIsIGUtPm5hbWUpCisJCQkJcmVhZG9ubHkoZmQsIGUtPmZsYWdzKTsKKwkJ
fQorCX0KKworCWlndF9zdWJ0ZXN0X3dpdGhfZHluYW1pY19zdWJzdWJ0ZXN0cygiZ3R0Iikgewor
CQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShmZCwgZSkgeworCQkJaWd0X2R5bmFtaWNfc3Vi
c3VidGVzdF9mKCIlcyIsIGUtPm5hbWUpCisJCQkJZ3R0KGZkLCBlLT5mbGFncyk7CisJCX0KIAl9
CiAKIAlpZ3RfZml4dHVyZSB7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
