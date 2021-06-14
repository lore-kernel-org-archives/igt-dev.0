Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F32A089F71
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 16:39:31 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id h16so10044394pjv.2
 for <igt-dev@lists.freedesktop.org>; Mon, 14 Jun 2021 09:39:31 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Mon, 14 Jun 2021 11:38:50 -0500
Message-Id: <20210614163902.366168-16-jason@jlekstrand.net>
In-Reply-To: <20210614163704.365989-1-jason@jlekstrand.net>
References: <20210614163704.365989-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 65/77] lib/igt_dummyload: Stop supporting
 ALL_ENGINES without an intel_ctx_t
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

U2lnbmVkLW9mZi1ieTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpSZXZp
ZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Ci0tLQogbGliL2lndF9kdW1teWxvYWQuYyB8IDIxICsrKysrKy0tLS0tLS0tLS0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbGliL2lndF9kdW1teWxvYWQuYyBiL2xpYi9pZ3RfZHVtbXlsb2FkLmMKaW5kZXgg
ODI0NTllNTI0Li5iMGE3YjM2MWMgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfZHVtbXlsb2FkLmMKKysr
IGIvbGliL2lndF9kdW1teWxvYWQuYwpAQCAtMTI5LDIyICsxMjksMTMgQEAgZW1pdF9yZWN1cnNp
dmVfYmF0Y2goaWd0X3NwaW5fdCAqc3BpbiwKIAlpZiAob3B0cy0+ZW5naW5lID09IEFMTF9FTkdJ
TkVTKSB7CiAJCXN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAqZW5naW5lOwogCi0JCWlm
IChvcHRzLT5jdHgpIHsKLQkJCWZvcl9lYWNoX2N0eF9lbmdpbmUoZmQsIG9wdHMtPmN0eCwgZW5n
aW5lKSB7Ci0JCQkJaWYgKG9wdHMtPmZsYWdzICYgSUdUX1NQSU5fUE9MTF9SVU4gJiYKLQkJCQkg
ICAgIWdlbV9jbGFzc19jYW5fc3RvcmVfZHdvcmQoZmQsIGVuZ2luZS0+Y2xhc3MpKQotCQkJCQlj
b250aW51ZTsKKwkJaWd0X2Fzc2VydChvcHRzLT5jdHgpOworCQlmb3JfZWFjaF9jdHhfZW5naW5l
KGZkLCBvcHRzLT5jdHgsIGVuZ2luZSkgeworCQkJaWYgKG9wdHMtPmZsYWdzICYgSUdUX1NQSU5f
UE9MTF9SVU4gJiYKKwkJCSAgICAhZ2VtX2NsYXNzX2Nhbl9zdG9yZV9kd29yZChmZCwgZW5naW5l
LT5jbGFzcykpCisJCQkJY29udGludWU7CiAKLQkJCQlmbGFnc1tuZW5naW5lKytdID0gZW5naW5l
LT5mbGFnczsKLQkJCX0KLQkJfSBlbHNlIHsKLQkJCWZvcl9lYWNoX2NvbnRleHRfZW5naW5lKGZk
LCBvcHRzLT5jdHhfaWQsIGVuZ2luZSkgewotCQkJCWlmIChvcHRzLT5mbGFncyAmIElHVF9TUElO
X1BPTExfUlVOICYmCi0JCQkJICAgICFnZW1fY2xhc3NfY2FuX3N0b3JlX2R3b3JkKGZkLCBlbmdp
bmUtPmNsYXNzKSkKLQkJCQkJY29udGludWU7Ci0KLQkJCQlmbGFnc1tuZW5naW5lKytdID0gZW5n
aW5lLT5mbGFnczsKLQkJCX0KKwkJCWZsYWdzW25lbmdpbmUrK10gPSBlbmdpbmUtPmZsYWdzOwog
CQl9CiAJfSBlbHNlIHsKIAkJZmxhZ3NbbmVuZ2luZSsrXSA9IG9wdHMtPmVuZ2luZTsKLS0gCjIu
MzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
