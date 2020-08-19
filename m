Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175AE6E091
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Aug 2020 12:33:19 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 19 Aug 2020 14:32:37 +0200
Message-Id: <20200819123306.22856-5-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200819123306.22856-1-zbigniew.kempczynski@intel.com>
References: <20200819123306.22856-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v30 04/33] lib/intel_bufops: add support for
 64bit bpp
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

UHJldmlvdXMgYXNzZXJ0IGNoZWNraW5nIHdhcyB0byBuYXJyb3cgYW5kIGl0IGRpZG4ndCBzdXBw
b3J0IDY0YnBwLgpTb21lIGttcyB0ZXN0cyB1c2UgNjRicHAgc28gZXh0ZW5kIHRoZSBhc3NlcnQu
CgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenlu
c2tpQGludGVsLmNvbT4KQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5pay5ncnplZ29yemVr
QGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgot
LS0KIGxpYi9pbnRlbF9idWZvcHMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9idWZvcHMuYyBiL2xp
Yi9pbnRlbF9idWZvcHMuYwppbmRleCBjNjQxZGJhNC4uMzVlM2MwZDIgMTAwNjQ0Ci0tLSBhL2xp
Yi9pbnRlbF9idWZvcHMuYworKysgYi9saWIvaW50ZWxfYnVmb3BzLmMKQEAgLTcwNiw3ICs3MDYs
NyBAQCBzdGF0aWMgdm9pZCBfX2ludGVsX2J1Zl9pbml0KHN0cnVjdCBidWZfb3BzICpib3BzLAog
CWlndF9hc3NlcnQoYm9wcyk7CiAJaWd0X2Fzc2VydChidWYpOwogCWlndF9hc3NlcnQod2lkdGgg
PiAwICYmIGhlaWdodCA+IDApOwotCWlndF9hc3NlcnQoYnBwID09IDggfHwgYnBwID09IDE2IHx8
IGJwcCA9PSAzMik7CisJaWd0X2Fzc2VydChicHAgPT0gOCB8fCBicHAgPT0gMTYgfHwgYnBwID09
IDMyIHx8IGJwcCA9PSA2NCk7CiAJaWd0X2Fzc2VydChhbGlnbm1lbnQgJSAyID09IDApOwogCiAJ
bWVtc2V0KGJ1ZiwgMCwgc2l6ZW9mKCpidWYpKTsKLS0gCjIuMjYuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0
LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
