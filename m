Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C4489E33
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:38 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:27 +0300
Message-Id: <20190523122727.6932-36-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 36/36] tests: Remove redundant igt_exit()
 calls
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

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0t
LQogdGVzdHMva21zX2RwX2RzYy5jICAgICAgIHwgMSAtCiB0ZXN0cy9rbXNfcGxhbmVfbG93cmVz
LmMgfCAyIC0tCiB0ZXN0cy9wcmltZV9tbWFwX2ttcy5jICAgfCAyIC0tCiAzIGZpbGVzIGNoYW5n
ZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2RwX2RzYy5jIGIvdGVz
dHMva21zX2RwX2RzYy5jCmluZGV4IDFiZmVmYmYyLi5lMmUzYWFhMCAxMDA2NDQKLS0tIGEvdGVz
dHMva21zX2RwX2RzYy5jCisrKyBiL3Rlc3RzL2ttc19kcF9kc2MuYwpAQCAtMzExLDUgKzMxMSw0
IEBAIGlndF9tYWluCiAJCWNsb3NlKGRhdGEuZHJtX2ZkKTsKIAkJaWd0X2Rpc3BsYXlfZmluaSgm
ZGF0YS5kaXNwbGF5KTsKIAl9Ci0JaWd0X2V4aXQoKTsKIH0KZGlmZiAtLWdpdCBhL3Rlc3RzL2tt
c19wbGFuZV9sb3dyZXMuYyBiL3Rlc3RzL2ttc19wbGFuZV9sb3dyZXMuYwppbmRleCAwYjc4NTcz
Zi4uNjhiODUwMjUgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZV9sb3dyZXMuYworKysgYi90
ZXN0cy9rbXNfcGxhbmVfbG93cmVzLmMKQEAgLTI2Miw2ICsyNjIsNCBAQCBpZ3RfbWFpbgogCWln
dF9maXh0dXJlIHsKIAkJaWd0X2Rpc3BsYXlfZmluaSgmZGF0YS5kaXNwbGF5KTsKIAl9Ci0KLQlp
Z3RfZXhpdCgpOwogfQpkaWZmIC0tZ2l0IGEvdGVzdHMvcHJpbWVfbW1hcF9rbXMuYyBiL3Rlc3Rz
L3ByaW1lX21tYXBfa21zLmMKaW5kZXggZmRjMzcyMTQuLjFjOTYzZTAxIDEwMDY0NAotLS0gYS90
ZXN0cy9wcmltZV9tbWFwX2ttcy5jCisrKyBiL3Rlc3RzL3ByaW1lX21tYXBfa21zLmMKQEAgLTI1
OCw2ICsyNTgsNCBAQCBpZ3RfbWFpbgogCQlpZ3RfZGlzcGxheV9maW5pKCZncHUuZGlzcGxheSk7
CiAJCWNsb3NlKGdwdS5kcm1fZmQpOwogCX0KLQotCWlndF9leGl0KCk7CiB9Ci0tIAoyLjE5LjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
