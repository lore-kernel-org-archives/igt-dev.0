Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D1589700
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 11:48:35 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue,  4 Jun 2019 14:48:35 +0300
Message-Id: <20190604114836.2830-3-simon.ser@intel.com>
In-Reply-To: <20190604114836.2830-1-simon.ser@intel.com>
References: <20190604114836.2830-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/3] lib/tests/igt_audio: add a pop test
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
aWIvdGVzdHMvaWd0X2F1ZGlvLmMgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKaW5kZXggNDdlNjFh
ZGY3NGZlLi44MjE4MTNiYWU0N2EgMTAwNjQ0Ci0tLSBhL2xpYi90ZXN0cy9pZ3RfYXVkaW8uYwor
KysgYi9saWIvdGVzdHMvaWd0X2F1ZGlvLmMKQEAgLTExNiw2ICsxMTYsMjYgQEAgc3RhdGljIHZv
aWQgdGVzdF9zaWduYWxfZGV0ZWN0X3dpdGhfdW5leHBlY3RlZF9mcmVxKHN0cnVjdCBhdWRpb19z
aWduYWwgKnNpZ25hbCkKIAlpZ3RfYXNzZXJ0KCFvayk7CiB9CiAKK3N0YXRpYyB2b2lkIHRlc3Rf
c2lnbmFsX2RldGVjdF9wb3Aoc3RydWN0IGF1ZGlvX3NpZ25hbCAqc2lnbmFsKQoreworCWRvdWJs
ZSAqYnVmOworCWJvb2wgb2s7CisJc2l6ZV90IGk7CisKKwlidWYgPSBtYWxsb2MoQlVGRkVSX0xF
TiAqIHNpemVvZihkb3VibGUpKTsKKwlhdWRpb19zaWduYWxfZmlsbChzaWduYWwsIGJ1ZiwgQlVG
RkVSX0xFTiAvIENIQU5ORUxTKTsKKworCS8qIEFkZCBhIGRpc2NvbnRpbnVpdHkgaW4gdGhlIHNp
Z25hbCAqLworCWZvciAoaSA9IDA7IGkgPCA1OyBpKyspCisJCWJ1ZltCVUZGRVJfTEVOIC8gMyAr
IGldID0gMC45OworCisJb2sgPSBhdWRpb19zaWduYWxfZGV0ZWN0KHNpZ25hbCwgU0FNUExJTkdf
UkFURSwgMCwgYnVmLCBCVUZGRVJfTEVOKTsKKworCWZyZWUoYnVmKTsKKworCWlndF9hc3NlcnQo
IW9rKTsKK30KKwogaWd0X21haW4KIHsKIAlzdHJ1Y3QgYXVkaW9fc2lnbmFsICpzaWduYWw7CkBA
IC0xNTEsNiArMTcxLDkgQEAgaWd0X21haW4KIAkJaWd0X3N1YnRlc3QoInNpZ25hbC1kZXRlY3Qt
d2l0aC11bmV4cGVjdGVkLWZyZXEiKQogCQkJdGVzdF9zaWduYWxfZGV0ZWN0X3dpdGhfdW5leHBl
Y3RlZF9mcmVxKHNpZ25hbCk7CiAKKwkJaWd0X3N1YnRlc3QoInNpZ25hbC1kZXRlY3QtcG9wIikK
KwkJCXRlc3Rfc2lnbmFsX2RldGVjdF9wb3Aoc2lnbmFsKTsKKwogCQlpZ3RfZml4dHVyZSB7CiAJ
CQlhdWRpb19zaWduYWxfZmluaShzaWduYWwpOwogCQl9Ci0tIAoyLjIxLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
