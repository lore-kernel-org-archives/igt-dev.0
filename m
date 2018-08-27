Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 073146E218
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 12:27:52 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id u10-v6so5653778pgr.1
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Aug 2018 05:27:52 -0700 (PDT)
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Date: Mon, 27 Aug 2018 15:27:33 +0300
Message-Id: <1535372854-3031-1-git-send-email-juhapekka.heikkila@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_plane_scaling: Allow
 DRM_FORMAT_RGB565 rotation on gen>=11
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

VGVzdCBEUk1fRk9STUFUX1JHQjU2NSByb3RhdGlvbiB3aGVuIGdlbiBpcyAxMSBvciBoaWdoZXIu
CgpTaWduZWQtb2ZmLWJ5OiBKdWhhLVBla2thIEhlaWtraWxhIDxqdWhhcGVra2EuaGVpa2tpbGFA
Z21haWwuY29tPgotLS0KIHRlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgfCA3ICsrKystLS0KIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMK
aW5kZXggMmYxOWE0Mi4uN2M2NGVkMSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lX3NjYWxp
bmcuYworKysgYi90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jCkBAIC0xNTYsMTAgKzE1NiwxMCBA
QCBzdGF0aWMgY29uc3QgaWd0X3JvdGF0aW9uX3Qgcm90YXRpb25zW10gPSB7CiAJSUdUX1JPVEFU
SU9OXzI3MCwKIH07CiAKLXN0YXRpYyBib29sIGNhbl9yb3RhdGUodW5zaWduZWQgZm9ybWF0KQor
c3RhdGljIGJvb2wgY2FuX3JvdGF0ZShkYXRhX3QgKmQsIHVuc2lnbmVkIGZvcm1hdCkKIHsKIAlp
ZiAoZm9ybWF0ID09IERSTV9GT1JNQVRfQzggfHwKLQkgICAgZm9ybWF0ID09IERSTV9GT1JNQVRf
UkdCNTY1KQorCSAgICAoaW50ZWxfZ2VuKGQtPmRldmlkKSA8IDExICYmIGZvcm1hdCA9PSBEUk1f
Rk9STUFUX1JHQjU2NSkpCiAJCXJldHVybiBmYWxzZTsKIAogCXJldHVybiB0cnVlOwpAQCAtMTgw
LDcgKzE4MCw4IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2NhbGVyX3dpdGhfcm90YXRpb25fcGlwZShk
YXRhX3QgKmQsIGVudW0gcGlwZSBwaXBlLAogCQkJaWd0X3JvdGF0aW9uX3Qgcm90ID0gcm90YXRp
b25zW2ldOwogCQkJZm9yIChpbnQgaiA9IDA7IGogPCBwbGFuZS0+ZHJtX3BsYW5lLT5jb3VudF9m
b3JtYXRzOyBqKyspIHsKIAkJCQl1bnNpZ25lZCBmb3JtYXQgPSBwbGFuZS0+ZHJtX3BsYW5lLT5m
b3JtYXRzW2pdOwotCQkJCWlmIChpZ3RfZmJfc3VwcG9ydGVkX2Zvcm1hdChmb3JtYXQpICYmIGNh
bl9yb3RhdGUoZm9ybWF0KSkKKwkJCQlpZiAoaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0
KSAmJgorCQkJCSAgICBjYW5fcm90YXRlKGQsIGZvcm1hdCkpCiAJCQkJCWNoZWNrX3NjYWxpbmdf
cGlwZV9wbGFuZV9yb3QoZCwgcGxhbmUsIGZvcm1hdCwKIAkJCQkJCQkJICAgICBMT0NBTF9JOTE1
X0ZPUk1BVF9NT0RfWV9USUxFRCwKIAkJCQkJCQkJICAgICBwaXBlLCBvdXRwdXQsIHJvdCk7Ci0t
IAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
aWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
