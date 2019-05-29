Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56626E318
 for <igt-dev@lists.freedesktop.org>; Wed, 29 May 2019 13:32:47 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 29 May 2019 16:32:50 +0300
Message-Id: <20190529133250.27817-6-simon.ser@intel.com>
In-Reply-To: <20190529133250.27817-1-simon.ser@intel.com>
References: <20190529133250.27817-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 5/5] lib/tests/igt_audio: add a pop test
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
Cc: martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

TWFrZSBzdXJlIGFkZGluZyBhIHBvcCBpbiB0aGUgaW5wdXQgc2lnbmFsIG1ha2VzIGF1ZGlvX3Np
Z25hbF9kZXRlY3QgZmFpbC4KClNpZ25lZC1vZmYtYnk6IFNpbW9uIFNlciA8c2ltb24uc2VyQGlu
dGVsLmNvbT4KLS0tCiBsaWIvdGVzdHMvaWd0X2F1ZGlvLmMgfCAyMyArKysrKysrKysrKysrKysr
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDIzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9s
aWIvdGVzdHMvaWd0X2F1ZGlvLmMgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKaW5kZXggMGYxYzM5
ZDkzNzI4Li4yMTRkY2VhNzNlZmMgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0cy9pZ3RfYXVkaW8uYwor
KysgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKQEAgLTExMSw2ICsxMTEsMjYgQEAgc3RhdGljIHZv
aWQgdGVzdF9zaWduYWxfZGV0ZWN0X2V4dHJhKHN0cnVjdCBhdWRpb19zaWduYWwgKnNpZ25hbCkK
IAlpZ3RfYXNzZXJ0KCFvayk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3Rfc2lnbmFsX2RldGVjdF9w
b3Aoc3RydWN0IGF1ZGlvX3NpZ25hbCAqc2lnbmFsKQoreworCWRvdWJsZSAqYnVmOworCWJvb2wg
b2s7CisJc2l6ZV90IGk7CisKKwlidWYgPSBtYWxsb2MoQlVGRkVSX0xFTiAqIHNpemVvZihkb3Vi
bGUpKTsKKwlhdWRpb19zaWduYWxfZmlsbChzaWduYWwsIGJ1ZiwgQlVGRkVSX0xFTiAvIENIQU5O
RUxTKTsKKworCS8qIEFkZCBhIGRpc2NvbnRpbnVpdHkgaW4gdGhlIHNpZ25hbCAqLworCWZvciAo
aSA9IDA7IGkgPCA1OyBpKyspCisJCWJ1ZltCVUZGRVJfTEVOIC8gMyArIGldID0gMC45OworCisJ
b2sgPSBhdWRpb19zaWduYWxfZGV0ZWN0KHNpZ25hbCwgU0FNUExJTkdfUkFURSwgMCwgYnVmLCBC
VUZGRVJfTEVOKTsKKworCWZyZWUoYnVmKTsKKworCWlndF9hc3NlcnQoIW9rKTsKK30KKwogaWd0
X21haW4KIHsKIAlzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWw7CkBAIC0xNDYsNiArMTY2LDkg
QEAgaWd0X21haW4KIAkJaWd0X3N1YnRlc3QoInNpZ25hbC1kZXRlY3QtZXh0cmEiKQogCQkJdGVz
dF9zaWduYWxfZGV0ZWN0X2V4dHJhKHNpZ25hbCk7CiAKKwkJaWd0X3N1YnRlc3QoInNpZ25hbC1k
ZXRlY3QtcG9wIikKKwkJCXRlc3Rfc2lnbmFsX2RldGVjdF9wb3Aoc2lnbmFsKTsKKwogCQlpZ3Rf
Zml4dHVyZSB7CiAJCQlhdWRpb19zaWduYWxfZmluaShzaWduYWwpOwogCQl9Ci0tIAoyLjIxLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
