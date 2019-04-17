Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCCE86E08F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 20:35:47 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 17 Apr 2019 23:35:40 +0300
Message-Id: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/igt_fb: Unref the renderecopy
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
c3QKd2l0aCAxR2lCIGZyYW1lYnVmZmVycy4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgMyAr
KysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0
X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggNmE0M2ZjYzQ3MzVmLi5jM2VjZDcxODY0NDQgMTAw
NjQ0Ci0tLSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTE2NDcsNiArMTY0
Nyw5IEBAIHN0YXRpYyB2b2lkIHJlbmRlcmNvcHkoc3RydWN0IGZiX2JsaXRfdXBsb2FkICpibGl0
LAogCXJlbmRlcl9jb3B5KGJsaXQtPmJhdGNoLCBOVUxMLAogCQkgICAgJnNyYywgMCwgMCwgZHN0
X2ZiLT5wbGFuZV93aWR0aFswXSwgZHN0X2ZiLT5wbGFuZV9oZWlnaHRbMF0sCiAJCSAgICAmZHN0
LCAwLCAwKTsKKworCWRybV9pbnRlbF9ib191bnJlZmVyZW5jZShkc3QuYm8pOworCWRybV9pbnRl
bF9ib191bnJlZmVyZW5jZShzcmMuYm8pOwogfQogCiBzdGF0aWMgdm9pZCBibGl0Y29weShjb25z
dCBzdHJ1Y3QgaWd0X2ZiICpkc3RfZmIsCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldg==
