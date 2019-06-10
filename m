Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB43890AD
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jun 2019 23:35:41 +0000 (UTC)
From: Anusha Srivatsa <anusha.srivatsa@intel.com>
Date: Mon, 10 Jun 2019 16:26:16 -0700
Message-Id: <20190610232617.5094-1-anusha.srivatsa@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_dp_dsc: Read the debugfs only
 once
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
Cc: Manasi Navare <manasi.d.navare@intel.com>, Anusha Srivatsa <anusha.srivatsa@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SW5zdGVhZCBvZiBkb2luZyBhIGRlYnVnZnNfc2ltcGxlX3JlYWQgYW5kIHRoZW4KYSBkZWJ1Z2Zz
X3JlYWQoKSwgbGV0cyByZWFkIHRoZSBkZWJ1Z2ZzIG5vZGUganVzdCBvbmNlLgpXZSBhbnl3YXkg
Z2V0IHRoZSBzdWl0YWJsZSByZXR1cm4gZnJvbSB0aGUgZm9sbG93aW5nCnN0cnN0ciBvcGVyYXRp
b24uCgpGb3IgYW55IGZvbGxvd2luZyBzdWJ0ZXN0cywgd2Ugd2lsbCBiZSByZWFkaW5nIG9ubHkg
dGhlCmNvbnRlbnRzIG9mIHRoZSBidWZmZXIuIFdlIGNhbiBhdm9pZCB0aGUgc2ltcGxlX3JlYWQK
YWx0b2dldGhlci4KCkNjOiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBBbnVzaGEgU3JpdmF0c2EgPGFudXNoYS5zcml2YXRzYUBpbnRlbC5j
b20+Ci0tLQogdGVzdHMva21zX2RwX2RzYy5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2RwX2RzYy5jIGIvdGVzdHMva21zX2Rw
X2RzYy5jCmluZGV4IGUyZTNhYWEwLi43ZjJiZjI3NiAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Rw
X2RzYy5jCisrKyBiL3Rlc3RzL2ttc19kcF9kc2MuYwpAQCAtODAsOCArODAsNiBAQCBzdGF0aWMg
Ym9vbCBpc19kcF9kc2Nfc3VwcG9ydGVkKGRhdGFfdCAqZGF0YSkKIAogCXN0cmNweShmaWxlX25h
bWUsIGRhdGEtPmNvbm5fbmFtZSk7CiAJc3RyY2F0KGZpbGVfbmFtZSwgIi9pOTE1X2RzY19mZWNf
c3VwcG9ydCIpOwotCWlndF9yZXF1aXJlKGlndF9kZWJ1Z2ZzX3NpbXBsZV9yZWFkKGRhdGEtPmRl
YnVnZnNfZmQsIGZpbGVfbmFtZSwgYnVmLAotCQkJCQkgICAgc2l6ZW9mKGJ1ZikpID4gMCk7CiAJ
aWd0X2RlYnVnZnNfcmVhZChkYXRhLT5kcm1fZmQsIGZpbGVfbmFtZSwgYnVmKTsKIAogCXJldHVy
biBzdHJzdHIoYnVmLCAiRFNDX1NpbmtfU3VwcG9ydDogeWVzIik7Ci0tIAoyLjE3LjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
