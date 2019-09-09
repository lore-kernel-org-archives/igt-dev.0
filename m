Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEA7289B5F
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2019 13:07:21 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Mon,  9 Sep 2019 16:07:07 +0300
Message-Id: <20190909130708.20862-5-mika.kahola@intel.com>
In-Reply-To: <20190909130708.20862-1-mika.kahola@intel.com>
References: <20190909130708.20862-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t 4/5] lib/igt_fb.c: Update tile sizes for
 GEN12 MCS
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

VXBkYXRlIHRpbGUgc2l6ZXMgZm9yIEdFTjEyIE1DUy4KClNpZ25lZC1vZmYtYnk6IE1pa2EgS2Fo
b2xhIDxtaWthLmthaG9sYUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgMiArKwogMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBi
L2xpYi9pZ3RfZmIuYwppbmRleCAzMmJmYmVlZS4uYzZlNGNmNzggMTAwNjQ0Ci0tLSBhL2xpYi9p
Z3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTM4Miw2ICszODIsNyBAQCB2b2lkIGlndF9n
ZXRfZmJfdGlsZV9zaXplKGludCBmZCwgdWludDY0X3QgbW9kaWZpZXIsIGludCBmYl9icHAsCiAJ
CX0KIAkJYnJlYWs7CiAJY2FzZSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9S
Q19DQ1M6CisJY2FzZSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9HRU4xMl9NQ19DQ1M6
CiAJCWlndF9yZXF1aXJlX2ludGVsKGZkKTsKIAkJc3dpdGNoIChmYl9icHApIHsKIAkJY2FzZSA4
OgpAQCAtNjgzLDYgKzY4NCw3IEBAIHVpbnQ2NF90IGlndF9mYl9tb2RfdG9fdGlsaW5nKHVpbnQ2
NF90IG1vZGlmaWVyKQogCWNhc2UgTE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lfVElMRUQ6CiAJY2Fz
ZSBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWV9USUxFRF9DQ1M6CiAJY2FzZSBMT0NBTF9JOTE1X0ZP
Uk1BVF9NT0RfWV9USUxFRF9HRU4xMl9SQ19DQ1M6CisJY2FzZSBMT0NBTF9JOTE1X0ZPUk1BVF9N
T0RfWV9USUxFRF9HRU4xMl9NQ19DQ1M6CiAJCXJldHVybiBJOTE1X1RJTElOR19ZOwogCWNhc2Ug
TE9DQUxfSTkxNV9GT1JNQVRfTU9EX1lmX1RJTEVEOgogCWNhc2UgTE9DQUxfSTkxNV9GT1JNQVRf
TU9EX1lmX1RJTEVEX0NDUzoKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9pZ3QtZGV2
