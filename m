Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F15936E4D0
 for <igt-dev@lists.freedesktop.org>; Wed, 23 May 2018 18:31:16 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 23 May 2018 21:31:04 +0300
Message-Id: <20180523183110.1975-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20180523183110.1975-1-ville.syrjala@linux.intel.com>
References: <20180523183110.1975-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/8] lib: Don't use dumb buffers for YCbCr
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
IGRvbid0IGRvIHRoZSAiYmxhY2sgIT0gemVybyIgY2xlYXJpbmcgZm9yIGR1bWIgYnVmZmVycywg
c28gbGV0J3Mgbm90CnVzZSB0aGVtIGZvciBZQ2JDciBmcmFtZWJ1ZmZlcnMuCgp2MjogVXNlIGln
dF9mb3JtYXRfaXNfeXV2KCkKClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9mYi5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2lndF9mYi5jIGIvbGliL2lndF9mYi5jCmluZGV4IDRmMTdmOTk0NTQxOS4uYzg5Zjc4NTBlZDcw
IDEwMDY0NAotLS0gYS9saWIvaWd0X2ZiLmMKKysrIGIvbGliL2lndF9mYi5jCkBAIC0zNTksNyAr
MzU5LDcgQEAgc3RhdGljIGludCBjcmVhdGVfYm9fZm9yX2ZiKGludCBmZCwgaW50IHdpZHRoLCBp
bnQgaGVpZ2h0LAogCWlmIChvZmZzZXRzKQogCQltZW1zZXQob2Zmc2V0cywgMCwgQVJSQVlfU0la
RShmb3JtYXQtPnBsYW5lX2JwcCkgKiBzaXplb2YoKm9mZnNldHMpKTsKIAotCWlmICh0aWxpbmcg
fHwgc2l6ZSB8fCBzdHJpZGUgfHwgZm9ybWF0LT5wbGFuZXMgPiAxKSB7CisJaWYgKHRpbGluZyB8
fCBzaXplIHx8IHN0cmlkZSB8fCBpZ3RfZm9ybWF0X2lzX3l1dihmb3JtYXQtPmRybV9pZCkpIHsK
IAkJdW5zaWduZWQgY2FsY3VsYXRlZF9zaXplLCBjYWxjdWxhdGVkX3N0cmlkZTsKIAogCQlpZiAo
Zm9ybWF0LT5wbGFuZXMgPiAxKQotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
