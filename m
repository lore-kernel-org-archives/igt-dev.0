Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4873B6E9A7
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 14:44:48 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Jul 2021 17:44:27 +0300
Message-Id: <20210716144442.31962-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
References: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 01/16] lib/kms: Add igt_rotation_90_or_270()
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIGhlbHBlciB0byBzaW1wbGlmeSB0aGUgOTAvMjcwIHZzLiAwLzE4MCByb3RhdGlvbiBjaGVj
a3MuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXgu
aW50ZWwuY29tPgotLS0KIGxpYi9pZ3Rfa21zLmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwg
NSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMuaCBiL2xpYi9pZ3Rfa21z
LmgKaW5kZXggOGNkZTI0Yjc5MTFmLi40NWQyMWU0MjUwM2UgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rf
a21zLmgKKysrIGIvbGliL2lndF9rbXMuaApAQCAtMzI5LDYgKzMyOSwxMSBAQCB0eXBlZGVmIGVu
dW0gewogI2RlZmluZSBJR1RfUk9UQVRJT05fTUFTSyBcCiAJKElHVF9ST1RBVElPTl8wIHwgSUdU
X1JPVEFUSU9OXzkwIHwgSUdUX1JPVEFUSU9OXzE4MCB8IElHVF9ST1RBVElPTl8yNzApCiAKK3N0
YXRpYyBpbmxpbmUgYm9vbCBpZ3Rfcm90YXRpb25fOTBfb3JfMjcwKGlndF9yb3RhdGlvbl90IHJv
dGF0aW9uKQoreworCXJldHVybiByb3RhdGlvbiAmIChJR1RfUk9UQVRJT05fOTAgfCBJR1RfUk9U
QVRJT05fMjcwKTsKK30KKwogdHlwZWRlZiBzdHJ1Y3QgaWd0X3BsYW5lIHsKIAkvKjwgcHJpdmF0
ZSA+Ki8KIAlpZ3RfcGlwZV90ICpwaXBlOwotLSAKMi4zMS4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2lndC1kZXYK
