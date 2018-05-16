Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277026E3D7
 for <igt-dev@lists.freedesktop.org>; Wed, 16 May 2018 11:57:19 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Wed, 16 May 2018 14:57:17 +0300
Message-Id: <1526471837-20098-1-git-send-email-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH CI_TEST] tests/kms_flip_tiling
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
List-ID: <igt-dev@lists.freedesktop.org>

TWFrZSBzdXJlIGZyYW1lYnVmZmVyIGNvbXByZXNzaW9uIGlzIGRpc2FibGVkIHdoZW4gcnVubmlu
ZyB0aGlzIHRlc3QuClRoaXMgbWF5IG9yIG1heSBub3QgaGF2ZSBhbiBlZmZlY3Qgb24gcGlwZSBj
cmMgbWlzbWF0Y2ggZXJyb3JzIHRoYXQKd2Uga2VlcCByZWNlaXZpbmcgZnJvbSBvdXIgQ0kgcnVu
cy4gVGhpcyBwYXRjaCBpcyBhbGwgYWJvdXQgZXhjbHVkaW5nIHRoZQpwb3NzaWJpbGl0eSB0aGF0
IGZiYyB3b3VsZCBoYXZlIGFuIGVmZmVjdCBvbiB0aGVzZSBlcnJvcnMuCgpUaGlzIHBhdGNoIGlz
IG5vdCBmb3IgcmV2aWV3IQoKUmVmZXJlbmNlczogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9wLm9y
Zy9zaG93X2J1Zy5jZ2k/aWQ9MTAzMTY2ClNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fob2xhIDxtaWth
LmthaG9sYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2ZsaXBfdGlsaW5nLmMgfCA0ICsrKysK
IDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNf
ZmxpcF90aWxpbmcuYyBiL3Rlc3RzL2ttc19mbGlwX3RpbGluZy5jCmluZGV4IDVhYWUyOWEuLjE5
YmU4MWQgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mbGlwX3RpbGluZy5jCisrKyBiL3Rlc3RzL2tt
c19mbGlwX3RpbGluZy5jCkBAIC0zMyw2ICszMyw5IEBACiAKIElHVF9URVNUX0RFU0NSSVBUSU9O
KCJUZXN0IHBhZ2UgZmxpcHMgYW5kIHRpbGluZyBzY2VuYXJpb3MiKTsKIAorI2RlZmluZSBmYmNf
ZW5hYmxlKCkgaWd0X3NldF9tb2R1bGVfcGFyYW1faW50KCJlbmFibGVfZmJjIiwgMSkKKyNkZWZp
bmUgZmJjX2Rpc2FibGUoKSBpZ3Rfc2V0X21vZHVsZV9wYXJhbV9pbnQoImVuYWJsZV9mYmMiLCAw
KQorCiB0eXBlZGVmIHN0cnVjdCB7CiAJaW50IGRybV9mZDsKIAlpZ3RfZGlzcGxheV90IGRpc3Bs
YXk7CkBAIC0xNzAsNiArMTczLDcgQEAgaWd0X21haW4KIAogCQlpZ3RfcmVxdWlyZV9waXBlX2Ny
YyhkYXRhLmRybV9mZCk7CiAJCWlndF9kaXNwbGF5X2luaXQoJmRhdGEuZGlzcGxheSwgZGF0YS5k
cm1fZmQpOworCQlmYmNfZGlzYWJsZSgpOwogCX0KIAogCS8qCi0tIAoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
