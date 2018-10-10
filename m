Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48EF6E11D
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Oct 2018 12:02:16 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Wed, 10 Oct 2018 08:01:46 -0400
Message-Id: <1539172908-20679-4-git-send-email-jyoti.r.yadav@intel.com>
In-Reply-To: <1539172908-20679-1-git-send-email-jyoti.r.yadav@intel.com>
References: <1539172908-20679-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 3/5] [intel-gfx] tests/pm_dc: Added test
 for DC6 during PSR.
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, anusha.srivatsa@intel.com, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGQgc3VidGVzdCB0byBjaGVjayBEQzYgZW50cnkgb24gUFNSIGZvciB0aGUg
c3VwcG9ydGVkCnBsYXRmb3Jtcy4KClNpZ25lZC1vZmYtYnk6IEp5b3RpIFlhZGF2IDxqeW90aS5y
LnlhZGF2QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9wbV9kYy5jIHwgNyArKysrKysrCiAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcG1fZGMuYyBiL3Rl
c3RzL3BtX2RjLmMKaW5kZXggNDEyNWQ4My4uOThlMDExZiAxMDA2NDQKLS0tIGEvdGVzdHMvcG1f
ZGMuYworKysgYi90ZXN0cy9wbV9kYy5jCkBAIC0yMDgsNiArMjA4LDEzIEBAIGludCBtYWluKGlu
dCBhcmdjLCBjaGFyICphcmd2W10pCiAJCXRlc3RfZGNfc3RhdGVfcHNyKCZkYXRhKTsKIAkJY2xl
YW51cCgmZGF0YSk7CiAJfQorCisJaWd0X3N1YnRlc3QoImRjNi1wc3IiKSB7CisJCWRhdGEuZGNf
ZmxhZ3MgfD0gQ0hFQ0tfREM2OworCQl0ZXN0X2RjX3N0YXRlX3BzcigmZGF0YSk7CisJCWNsZWFu
dXAoJmRhdGEpOworCX0KKwogCWlndF9maXh0dXJlIHsKIAkJY2xvc2UoZGF0YS5kZWJ1Z2ZzX2Zk
KTsKIAkJZGlzcGxheV9maW5pKCZkYXRhKTsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
