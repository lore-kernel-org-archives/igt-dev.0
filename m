Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48C186E190
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Mar 2020 14:50:37 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id l184so1078251pfl.7
 for <igt-dev@lists.freedesktop.org>; Wed, 04 Mar 2020 06:50:37 -0800 (PST)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Wed,  4 Mar 2020 16:50:27 +0200
Message-Id: <1583333427-18040-1-git-send-email-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_cursor_legacy: increase timeout
 for nonblocking flip wait
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

V2hlbiBydW4gb24gbW9yZSB0aGFuIG9uZSBtb25pdG9yIHRoZXJlIG1heSBiZSBtb2Rlc2V0IGlu
IHF1ZXVlCndoaWNoIHdpbGwgYmxvY2sgZmxpcC4gS2VybmVsIHdpbGwgdGltZW91dCB3aXRoIG1v
ZGVzZXQgYXQKdGVuIHNlY29uZHMgc28gbGV0cyB3YWl0IGluIHRlc3QgYWxzbyB0aGF0IHNhbWUg
dGVuIHNlY29uZHMgYXQKbWF4aW11bS4KClYyIFZpbGxlIFN5cmrDpGzDpDogbGV0cyBqdXN0IHdh
aXQgZm9yIGZpdmUgc2Vjb25kcwoKU2lnbmVkLW9mZi1ieTogSnVoYS1QZWtrYSBIZWlra2lsYSA8
anVoYXBla2thLmhlaWtraWxhQGdtYWlsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfY3Vyc29yX2xlZ2Fj
eS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2N1cnNvcl9sZWdhY3kuYyBiL3Rlc3RzL2ttc19jdXJz
b3JfbGVnYWN5LmMKaW5kZXggZjQxZjY4ZC4uZDVmOTViOCAxMDA2NDQKLS0tIGEvdGVzdHMva21z
X2N1cnNvcl9sZWdhY3kuYworKysgYi90ZXN0cy9rbXNfY3Vyc29yX2xlZ2FjeS5jCkBAIC0yNTEs
NyArMjUxLDcgQEAgc3RhdGljIHZvaWQgZmxpcF9ub25ibG9ja2luZyhpZ3RfZGlzcGxheV90ICpk
aXNwbGF5LCBlbnVtIHBpcGUgcGlwZV9pZCwgYm9vbCBhdG8KIAlpZ3RfcGxhbmVfdCAqcHJpbWFy
eSA9IGlndF9waXBlX2dldF9wbGFuZV90eXBlKHBpcGUsIERSTV9QTEFORV9UWVBFX1BSSU1BUlkp
OwogCWludCByZXQ7CiAKLQlpZ3Rfc2V0X3RpbWVvdXQoMSwgIlNjaGVkdWxpbmcgcGFnZSBmbGlw
XG4iKTsKKwlpZ3Rfc2V0X3RpbWVvdXQoNSwgIlNjaGVkdWxpbmcgcGFnZSBmbGlwXG4iKTsKIAlp
ZiAoIWF0b21pYykgewogCQkvKiBTY2hlZHVsZSBhIG5vbmJsb2NraW5nIGZsaXAgZm9yIHRoZSBu
ZXh0IHZibGFuayAqLwogCQlkbyB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
