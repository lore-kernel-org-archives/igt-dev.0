Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0E9C6E21F
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 12:27:53 +0000 (UTC)
Received: by mail-pl1-x644.google.com with SMTP id f6-v6so4110548plo.1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 05:27:53 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 27 Aug 2018 15:27:34 +0300
Message-Id: <1535372854-3031-2-git-send-email-juhapekka.heikkila@gmail.com>
In-Reply-To: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
References: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/kms_rotation_crc: Fix
 bad-pixel-format not to be run on gen11 and later
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Z2VuMTEgZW5hYmxlcyA5MC8yNzAgcm90YXRpb24gZm9yIFJHQjU2NSBtb2RlLiBJR1Qgd291bGQg
bmVlZCBzdXBwb3J0IGZvcgpDOCBtb2RlIHRvIGVuYWJsZSBydW5uaW5nIHRoaXMgc3VidGVzdCBv
biBnZW4xMSBhbmQgbGF0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxq
dWhhcGVra2EuaGVpa2tpbGFAZ21haWwuY29tPgotLS0KIHRlc3RzL2ttc19yb3RhdGlvbl9jcmMu
YyB8IDYgKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jIGIvdGVzdHMva21zX3JvdGF0aW9uX2NyYy5jCmlu
ZGV4IGI5OTRjYzUuLjM1ZTY3MjEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19yb3RhdGlvbl9jcmMu
YworKysgYi90ZXN0cy9rbXNfcm90YXRpb25fY3JjLmMKQEAgLTU1OCw2ICs1NTgsMTIgQEAgaWd0
X21haW4KIAogCWlndF9zdWJ0ZXN0X2YoImJhZC1waXhlbC1mb3JtYXQiKSB7CiAJCWlndF9yZXF1
aXJlKGdlbiA+PSA5KTsKKwkJLyoKKwkJICogZ2VuMTEgZW5hYmxlcyBSR0I1NjUgcm90YXRpb24g
Zm9yIDkwLzI3MCBkZWdyZWVzLgorCQkgKiBDOCBtb2RlIG5lZWQgdG8gYmUgZW5hYmxlZCBmb3Ig
SUdUIGlmIHdhbnQgdG8gcnVuIHRoaXMgdGVzdAorCQkgKiBvbiBnZW4xMSBvbndhcmRzLgorCQkg
Ki8KKwkJaWd0X3JlcXVpcmUoZ2VuIDwgMTEpOwogCQlkYXRhLnJvdGF0aW9uID0gSUdUX1JPVEFU
SU9OXzkwOwogCQlkYXRhLm92ZXJyaWRlX2ZtdCA9IERSTV9GT1JNQVRfUkdCNTY1OwogCQl0ZXN0
X3BsYW5lX3JvdGF0aW9uKCZkYXRhLCBEUk1fUExBTkVfVFlQRV9QUklNQVJZLCB0cnVlKTsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
