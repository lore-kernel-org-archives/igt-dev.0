Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA1EB89D99
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 10:49:23 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Thu, 23 May 2019 13:49:08 +0300
Message-Id: <20190523104908.29176-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_audio: fix uninitialized variable
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

U2VlbXMgbGlrZSBJJ20gbm90IHVzZWQgdG8gdGhlIEM4OSBzdHlsZSB5ZXQsIGFuZCBBU2FuIGNh
dWdodCBpdCBidXQgd2l0aCBhCmNvbXBsZXRlbHkgdW5yZWxhdGVkIHN0YWNrIHRyYWNlLgoKU2ln
bmVkLW9mZi1ieTogU2ltb24gU2VyIDxzaW1vbi5zZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3Rf
YXVkaW8uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0
IGEvbGliL2lndF9hdWRpby5jIGIvbGliL2lndF9hdWRpby5jCmluZGV4IDA3OTM1ZTY2MGM1YS4u
Mzc2ZTA0YmE2ZWQ2IDEwMDY0NAotLS0gYS9saWIvaWd0X2F1ZGlvLmMKKysrIGIvbGliL2lndF9h
dWRpby5jCkBAIC0yMDUsNiArMjA1LDcgQEAgc3RhdGljIHNpemVfdCBhdWRpb19zaWduYWxfY291
bnRfZnJlcXMoc3RydWN0IGF1ZGlvX3NpZ25hbCAqc2lnbmFsLCBpbnQgY2hhbm5lbCkKIAlzaXpl
X3QgbiwgaTsKIAlzdHJ1Y3QgYXVkaW9fc2lnbmFsX2ZyZXEgKmZyZXE7CgorCW4gPSAwOwogCWZv
ciAoaSA9IDA7IGkgPCBzaWduYWwtPmZyZXFzX2NvdW50OyBpKyspIHsKIAkJZnJlcSA9ICZzaWdu
YWwtPmZyZXFzW2ldOwogCQlpZiAoZnJlcS0+Y2hhbm5lbCA8IDAgfHwgZnJlcS0+Y2hhbm5lbCA9
PSBjaGFubmVsKQotLQoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldg==
