Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 812C889341
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Apr 2019 16:21:18 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Fri, 26 Apr 2019 19:21:07 +0300
Message-Id: <20190426162110.1768-5-simon.ser@intel.com>
In-Reply-To: <20190426162110.1768-1-simon.ser@intel.com>
References: <20190426162110.1768-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/7] test/kms_chamelium: disable >48KHz
 audio tests
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
Cc: Martin Peres <martin.peres@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlc2Ugd2VyZW4ndCB0ZXN0ZWQgb24gRGlzcGxheVBvcnQgKGJlY2F1c2UgdGhlIENoYW1lbGl1
bSdzIGRlZmF1bHQgRURJRApkb2Vzbid0IGFkdmVydGlzZSB0aGVtKSBzbyB0aGlzIGRvZXNuJ3Qg
cmVtb3ZlIHNvbWUgdGVzdCBjYXNlcy4KCk9uIEhETUkgdGhleSBkb24ndCB3b3JrIHJlbGlhYmx5
OiBzb21ldGltZXMgbm8gYXVkaW8gZGF0YSBpcyBjYXB0dXJlZCBieSB0aGUKQ2hhbWVsaXVtLiBU
aGlzIG5lZWRzIHRvIGJlIGludmVzdGlnYXRlZCwgYnV0IGZvciBub3cgbGV0J3MganVzdCBkaXNh
YmxlIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+
Ci0tLQogdGVzdHMva21zX2NoYW1lbGl1bS5jIHwgOSArKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X2NoYW1lbGl1bS5jIGIvdGVzdHMva21zX2NoYW1lbGl1bS5jCmluZGV4IDEyNmFmMjI2Li43MThl
NGFhZCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2NoYW1lbGl1bS5jCisrKyBiL3Rlc3RzL2ttc19j
aGFtZWxpdW0uYwpAQCAtNzI1LDE0ICs3MjUsMTUgQEAgdGVzdF9kaXNwbGF5X2ZyYW1lX2R1bXAo
ZGF0YV90ICpkYXRhLCBzdHJ1Y3QgY2hhbWVsaXVtX3BvcnQgKnBvcnQpCiAvKiBBIHN0cmVhayBv
ZiAzIGdpdmVzIGNvbmZpZGVuY2UgdGhhdCB0aGUgc2lnbmFsIGlzIGdvb2QuICovCiAjZGVmaW5l
IE1JTl9TVFJFQUsgMwogCisvKiBUT0RPOiBlbmFibGUgPjQ4S0h6IHJhdGVzLCB0aGVzZSBhcmUg
bm90IHJlbGlhYmxlICovCiBzdGF0aWMgaW50IHRlc3Rfc2FtcGxpbmdfcmF0ZXNbXSA9IHsKIAkz
MjAwMCwKIAk0NDEwMCwKIAk0ODAwMCwKLQk4ODIwMCwKLQk5NjAwMCwKLQkxNzY0MDAsCi0JMTky
MDAwLAorCS8qIDg4MjAwLCAqLworCS8qIDk2MDAwLCAqLworCS8qIDE3NjQwMCwgKi8KKwkvKiAx
OTIwMDAsICovCiB9OwogCiBzdGF0aWMgaW50IHRlc3Rfc2FtcGxpbmdfcmF0ZXNfY291bnQgPSBz
aXplb2YodGVzdF9zYW1wbGluZ19yYXRlcykgLyBzaXplb2YoaW50KTsKLS0gCjIuMjEuMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
