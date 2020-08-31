Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C522A6E134
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 13:32:46 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 31 Aug 2020 15:30:48 +0200
Message-Id: <20200831133049.37017-40-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
References: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v33 39/40] tests/gem_render_tiled_blits:
 address review comment (remove sync)
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

U3luYyBpcyBub3QgbmVjZXNzYXJ5LCB3ZSB3YW50IHRvIHZlcmlmeSBrZXJuZWwgc3luYyBwb2lu
dHMgZnJvbQpBUEkgKGdlbV9zZXRfZG9tYWluL2dlbV9wcmVhZCkuCgpTaWduZWQtb2ZmLWJ5OiBa
YmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6
IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6IENo
cmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2Vt
X3JlbmRlcl90aWxlZF9ibGl0cy5jIHwgMSAtCiAxIGZpbGUgY2hhbmdlZCwgMSBkZWxldGlvbigt
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl90aWxlZF9ibGl0cy5jIGIvdGVz
dHMvaTkxNS9nZW1fcmVuZGVyX3RpbGVkX2JsaXRzLmMKaW5kZXggMGQ4M2E0M2UuLjNlMDdmMzJj
IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9yZW5kZXJfdGlsZWRfYmxpdHMuYworKysgYi90
ZXN0cy9pOTE1L2dlbV9yZW5kZXJfdGlsZWRfYmxpdHMuYwpAQCAtNjcsNyArNjcsNiBAQCBjaGVj
a19idWYoc3RydWN0IGludGVsX2JiICppYmIsIHN0cnVjdCBpbnRlbF9idWYgKmJ1ZiwgdWludDMy
X3QgdmFsKQogCWludCBpOwogCiAJcmVuZGVyX2NvcHkoaWJiLCAwLCBidWYsIDAsIDAsIFdJRFRI
LCBIRUlHSFQsICZsaW5lYXIsIDAsIDApOwotCWludGVsX2JiX3N5bmMoaWJiKTsKIAogCWlmIChz
bm9vcCkgewogCQlwdHIgPSBnZW1fbW1hcF9fY3B1X2NvaGVyZW50KGk5MTUsIGxpbmVhci5oYW5k
bGUsIDAsCi0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dgo=
