Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C21E6E072
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jan 2021 19:57:48 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 14 Jan 2021 20:57:04 +0100
Message-Id: <20210114195736.62948-2-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210114195736.62948-1-zbigniew.kempczynski@intel.com>
References: <20210114195736.62948-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v15 01/33] tests/gem_softpin: Fix object
 leak in softpin test
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

U2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNr
aUBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4K
LS0tCiB0ZXN0cy9pOTE1L2dlbV9zb2Z0cGluLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fc29mdHBpbi5jIGIvdGVz
dHMvaTkxNS9nZW1fc29mdHBpbi5jCmluZGV4IDdlZGI2MTBiYS4uYWJhMDYwYTQyIDEwMDY0NAot
LS0gYS90ZXN0cy9pOTE1L2dlbV9zb2Z0cGluLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fc29mdHBp
bi5jCkBAIC0yOTAsNiArMjkwLDggQEAgc3RhdGljIHZvaWQgdGVzdF9zb2Z0cGluKGludCBmZCkK
IAkJY291bnQrKzsKIAl9CiAJaWd0X2luZm8oIkNvbXBsZXRlZCAlbHUgY3ljbGVzXG4iLCBjb3Vu
dCk7CisKKwlnZW1fY2xvc2UoZmQsIGxhc3RfaGFuZGxlKTsKIH0KIAogc3RhdGljIHZvaWQgaW52
YWxpZF9leGVjYnVmKGludCBpOTE1LCBzdHJ1Y3QgZHJtX2k5MTVfZ2VtX2V4ZWNidWZmZXIyICpl
eGVjYnVmKQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
