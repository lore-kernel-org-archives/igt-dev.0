Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 811D56E131
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 12:10:02 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 18 Apr 2019 15:09:57 +0300
Message-Id: <20190418120957.20541-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
References: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/5] lib/igt_fb: Unref the renderecopy
 scratch bos
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
J3JlIGN1cnJlbnRseSBsZWFraW5nIGFsbCB0aGUgdGVtcG9yYXJ5IGJvcyB3ZSBjb25zdHJ1Y3QK
Zm9yIHJlbmRlcmNvcHkuIFRoYXQgZG9lc24ndCBnbyBzbyB3ZWxsIHdoZW4gdHJ5aW5nIHRvIHRl
c3QKd2l0aCAxR2lCIGZyYW1lYnVmZmVycy4KCnYyOiBBZGQgZmluaV9idWYoKSAoQ2hyaXMpCgpT
aWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwu
Y29tPgpSZXZpZXdlZC1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Ci0tLQogbGliL2lndF9mYi5jIHwgOCArKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA2
YTQzZmNjNDczNWYuLjc2NmU1MDRkNWZjZSAxMDA2NDQKLS0tIGEvbGliL2lndF9mYi5jCisrKyBi
L2xpYi9pZ3RfZmIuYwpAQCAtMTYyOCw2ICsxNjI4LDExIEBAIHN0YXRpYyB2b2lkIGluaXRfYnVm
KHN0cnVjdCBmYl9ibGl0X3VwbG9hZCAqYmxpdCwKIAl9CiB9CiAKK3N0YXRpYyB2b2lkIGZpbmlf
YnVmKHN0cnVjdCBpZ3RfYnVmICpidWYpCit7CisJZHJtX2ludGVsX2JvX3VucmVmZXJlbmNlKGJ1
Zi0+Ym8pOworfQorCiBzdGF0aWMgdm9pZCByZW5kZXJjb3B5KHN0cnVjdCBmYl9ibGl0X3VwbG9h
ZCAqYmxpdCwKIAkJICAgICAgIGNvbnN0IHN0cnVjdCBpZ3RfZmIgKmRzdF9mYiwKIAkJICAgICAg
IGNvbnN0IHN0cnVjdCBpZ3RfZmIgKnNyY19mYikKQEAgLTE2NDcsNiArMTY1Miw5IEBAIHN0YXRp
YyB2b2lkIHJlbmRlcmNvcHkoc3RydWN0IGZiX2JsaXRfdXBsb2FkICpibGl0LAogCXJlbmRlcl9j
b3B5KGJsaXQtPmJhdGNoLCBOVUxMLAogCQkgICAgJnNyYywgMCwgMCwgZHN0X2ZiLT5wbGFuZV93
aWR0aFswXSwgZHN0X2ZiLT5wbGFuZV9oZWlnaHRbMF0sCiAJCSAgICAmZHN0LCAwLCAwKTsKKwor
CWZpbmlfYnVmKCZkc3QpOworCWZpbmlfYnVmKCZzcmMpOwogfQogCiBzdGF0aWMgdm9pZCBibGl0
Y29weShjb25zdCBzdHJ1Y3QgaWd0X2ZiICpkc3RfZmIsCi0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
