Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85C316E3F9
 for <igt-dev@lists.freedesktop.org>; Mon, 18 May 2020 09:09:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 18 May 2020 11:09:14 +0200
Message-Id: <20200518090919.14756-3-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200518090919.14756-1-zbigniew.kempczynski@intel.com>
References: <20200518090919.14756-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 2/7] lib/rendercopy_bufmgr: Pass
 alignment during buffer initialization
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIGxpbmVhciBidWZmZXIgYnVmX29wcyBjdXJyZW50bHkgd2FzIGV4dGVuZGVkIHRvIGFsaWdu
IHRoZSBzdHJpZGUKc28gd2UgbmVlZCB0byB1cGRhdGUgdGhlIGNhbGwuCgpTaWduZWQtb2ZmLWJ5
OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4K
Q2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIGxpYi9yZW5k
ZXJjb3B5X2J1Zm1nci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9yZW5kZXJjb3B5X2J1Zm1nci5jIGIv
bGliL3JlbmRlcmNvcHlfYnVmbWdyLmMKaW5kZXggOTY2MDMyMjkuLmRjMzhkNTMwIDEwMDY0NAot
LS0gYS9saWIvcmVuZGVyY29weV9idWZtZ3IuYworKysgYi9saWIvcmVuZGVyY29weV9idWZtZ3Iu
YwpAQCAtMTYzLDggKzE2Myw4IEBAIHZvaWQgaWd0X2J1Zl9pbml0KHN0cnVjdCByZW5kZXJjb3B5
X2J1Zm1nciAqYm1nciwgc3RydWN0IGlndF9idWYgKmJ1ZiwKIAlpbnRlbF9idWZfaW5pdF91c2lu
Z19oYW5kbGUoYm1nci0+Ym9wcywKIAkJCQkgICAgYnVmLT5iby0+aGFuZGxlLAogCQkJCSAgICAm
aWJ1ZiwKLQkJCQkgICAgd2lkdGgsIGhlaWdodCwgYnBwLCB0aWxpbmcsCi0JCQkJICAgIGNvbXBy
ZXNzaW9uKTsKKwkJCQkgICAgd2lkdGgsIGhlaWdodCwgYnBwLCAwLAorCQkJCSAgICB0aWxpbmcs
IGNvbXByZXNzaW9uKTsKIAogCWJ1Zi0+Y2NzWzBdLm9mZnNldCA9IGlidWYuYXV4Lm9mZnNldDsK
IAlidWYtPmNjc1swXS5zdHJpZGUgPSBpYnVmLmF1eC5zdHJpZGU7Ci0tIAoyLjI2LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
