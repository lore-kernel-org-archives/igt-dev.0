Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C48AF8991A
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Jul 2019 13:02:29 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Tue,  2 Jul 2019 16:02:29 +0300
Message-Id: <20190702130229.23742-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_eld: print debug message when no
 ELD is found
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

V2hlbiB0aGlzIGhhcHBlbnMsIHRoZSBsb2dzIHdlcmUgY29tcGxldGVseSBlbXB0eSBwcmV2aW91
c2x5LCB3aGljaCBjYW4gYmUKcXVpdGUgY29uZnVzaW5nLgoKU2lnbmVkLW9mZi1ieTogU2ltb24g
U2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3RfZWxkLmMgfCA4ICsrKysrKyst
CiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvbGliL2lndF9lbGQuYyBiL2xpYi9pZ3RfZWxkLmMKaW5kZXggM2Q3ZmQ0ZGQwYTgyLi4x
NmM0YWMwNmM2ZjYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZWxkLmMKKysrIGIvbGliL2lndF9lbGQu
YwpAQCAtMjA3LDEwICsyMDcsMTEgQEAgYm9vbCBlbGRfZ2V0X2lndChzdHJ1Y3QgZWxkX2VudHJ5
ICplbGQpCiB7CiAJRElSICpkaXI7CiAJc3RydWN0IGRpcmVudCAqZGlyZW50OwotCWludCBpOwor
CWludCBpLCBuX2VsZHM7CiAJY2hhciBjYXJkWzY0XTsKIAljaGFyIHBhdGhbUEFUSF9NQVhdOwoK
KwluX2VsZHMgPSAwOwogCWZvciAoaSA9IDA7IGkgPCA4OyBpKyspIHsKIAkJc25wcmludGYoY2Fy
ZCwgc2l6ZW9mKGNhcmQpLCAiL3Byb2MvYXNvdW5kL2NhcmQlZCIsIGkpOwogCQlkaXIgPSBvcGVu
ZGlyKGNhcmQpOwpAQCAtMjIyLDYgKzIyMyw4IEBAIGJvb2wgZWxkX2dldF9pZ3Qoc3RydWN0IGVs
ZF9lbnRyeSAqZWxkKQogCQkJCSAgICBzdHJsZW4oRUxEX1BSRUZJWCkpICE9IDApCiAJCQkJY29u
dGludWU7CgorCQkJbl9lbGRzKys7CisKIAkJCXNucHJpbnRmKHBhdGgsIHNpemVvZihwYXRoKSwg
IiVzLyVzIiwgY2FyZCwKIAkJCQkgZGlyZW50LT5kX25hbWUpOwogCQkJaWYgKCFlbGRfcGFyc2Vf
ZW50cnkocGF0aCwgZWxkKSkgewpAQCAtMjQ2LDYgKzI0OSw5IEBAIGJvb2wgZWxkX2dldF9pZ3Qo
c3RydWN0IGVsZF9lbnRyeSAqZWxkKQogCQljbG9zZWRpcihkaXIpOwogCX0KCisJaWYgKG5fZWxk
cyA9PSAwKQorCQlpZ3RfZGVidWcoIkZvdW5kIHplcm8gRUxEc1xuIik7CisKIAlyZXR1cm4gZmFs
c2U7CiB9CgotLQoyLjIyLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRl
dg==
