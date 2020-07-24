Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 296C16E94A
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Jul 2020 09:57:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Fri, 24 Jul 2020 11:56:49 +0200
Message-Id: <20200724095659.535-4-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200724095659.535-1-zbigniew.kempczynski@intel.com>
References: <20200724095659.535-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 03/13] tests/gem_caching: adopt to batch
 flush function cleanup
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

aW50ZWxfYmIgQVBJIGhhcyBiZWVuIGNsZWFuZWQgc28gZmx1c2ggZ2VuZXJhdGVzIGFsc28gQkJF
IGFuZCBleGVjdXRlcwp0aGUgYmF0Y2guIFJlbW92ZSByZWR1bmRhbnQgY29kZSB0byB1c2UgZmx1
c2ggcHJvcGVybHkuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IERvbWluaWsgR3J6ZWdvcnplayA8ZG9taW5p
ay5ncnplZ29yemVrQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2ls
c29uLmNvLnVrPgotLS0KIHRlc3RzL2k5MTUvZ2VtX2NhY2hpbmcuYyB8IDUgLS0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2Nh
Y2hpbmcuYyBiL3Rlc3RzL2k5MTUvZ2VtX2NhY2hpbmcuYwppbmRleCAxZDg5ODlkYi4uMjNlNDIx
MzIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX2NhY2hpbmcuYworKysgYi90ZXN0cy9pOTE1
L2dlbV9jYWNoaW5nLmMKQEAgLTk5LDExICs5OSw2IEBAIGNvcHlfYm8oc3RydWN0IGludGVsX2Ji
ICppYmIsIHN0cnVjdCBpbnRlbF9idWYgKnNyYywgc3RydWN0IGludGVsX2J1ZiAqZHN0KQogCWlu
dGVsX2JiX2VtaXRfcmVsb2NfZmVuY2VkKGliYiwgc3JjLT5oYW5kbGUsCiAJCQkJICAgSTkxNV9H
RU1fRE9NQUlOX1JFTkRFUiwKIAkJCQkgICAwLCAwLCAweDApOwotCi0JIC8qIE1hcmsgdGhlIGVu
ZCBvZiB0aGUgYnVmZmVyLiAqLwotCWludGVsX2JiX291dChpYmIsIE1JX0JBVENIX0JVRkZFUl9F
TkQpOwotCWludGVsX2JiX3B0cl9hbGlnbihpYmIsIDgpOwotCiAJaW50ZWxfYmJfZmx1c2hfYmxp
dChpYmIpOwogCWludGVsX2JiX3N5bmMoaWJiKTsKIH0KLS0gCjIuMjYuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
