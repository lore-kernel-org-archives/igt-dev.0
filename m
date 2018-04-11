Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B92188970B
 for <igt-dev@lists.freedesktop.org>; Wed, 11 Apr 2018 21:45:33 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed, 11 Apr 2018 14:45:31 -0700
Message-Id: <20180411214531.36613-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/gem_close_race: Wait for work to
 complete before terminating test
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

TWFrZSBzdXJlIGFsbCBvdXRzdGFuZGluZyB3b3JrIGhhcyBjb21wbGV0ZWQgYmVmb3JlIGV4aXRp
bmcgdGhlIHRlc3QuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8u
YXJnZW56aWFub0BpbnRlbC5jb20+Ci0tLQogdGVzdHMvZ2VtX2Nsb3NlX3JhY2UuYyB8IDQgKysr
KwogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2dl
bV9jbG9zZV9yYWNlLmMgYi90ZXN0cy9nZW1fY2xvc2VfcmFjZS5jCmluZGV4IGJjMTEyN2IxLi4x
MWQ2MjZkYyAxMDA2NDQKLS0tIGEvdGVzdHMvZ2VtX2Nsb3NlX3JhY2UuYworKysgYi90ZXN0cy9n
ZW1fY2xvc2VfcmFjZS5jCkBAIC0xNDgsNiArMTQ4LDggQEAgc3RhdGljIHZvaWQgcHJvY2Vzcyhp
bnQgY2hpbGQpCiAJaGFuZGxlID0gbG9hZChmZCk7CiAJaWYgKChjaGlsZCAmIDYzKSA9PSA2MykK
IAkJZ2VtX3JlYWQoZmQsIGhhbmRsZSwgMCwgJmhhbmRsZSwgc2l6ZW9mKGhhbmRsZSkpOworCisJ
Z2VtX3F1aWVzY2VudF9ncHUoZmQpOwogfQogCiBzdHJ1Y3QgY3Jhc2htZSB7CkBAIC0yMDMsNiAr
MjA1LDggQEAgc3RhdGljIHZvaWQgdGhyZWFkcyhpbnQgdGltZW91dCkKIAl9CiAKIAl0aW1lcl9k
ZWxldGUodGltZXIpOworCisJZ2VtX3F1aWVzY2VudF9ncHUoZmQpOwogCWNsb3NlKGZkKTsKIH0K
IAotLSAKMi4xNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
