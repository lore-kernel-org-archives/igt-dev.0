Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CFDC892D5
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 23:43:53 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id d9so21493551edh.12
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Feb 2019 15:43:53 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Thu, 21 Feb 2019 00:43:44 +0100
Message-Id: <20190220234345.18692-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] tests/kms_pwrite_crtc: Drop fixtures
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
To: IGT development <igt-dev@lists.freedesktop.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Tm90IGFsbG93ZWQgaW4gaWd0X3NpbXBsZV9tYWluLCBhbHNvIHJlYWxseSBkb2Vzbid0IG1ha2Ug
YW55IHNlbnNlLAppdCdzIGFsbCBqdXN0IG9uZSBiaWcgdGVzdGNhc2UuCgpTaWduZWQtb2ZmLWJ5
OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNf
cHdyaXRlX2NyYy5jIHwgMTYgKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3B3cml0
ZV9jcmMuYyBiL3Rlc3RzL2ttc19wd3JpdGVfY3JjLmMKaW5kZXggZmZkNzJlNGFiY2M1Li45YmI1
YTVkYWJiZjkgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wd3JpdGVfY3JjLmMKKysrIGIvdGVzdHMv
a21zX3B3cml0ZV9jcmMuYwpAQCAtMTc2LDIxICsxNzYsMTcgQEAgaWd0X3NpbXBsZV9tYWluCiB7
CiAJaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOwogCi0JaWd0X2ZpeHR1cmUgewotCQlkYXRhLmRy
bV9mZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lOVEVMKTsKKwlkYXRhLmRybV9m
ZCA9IGRybV9vcGVuX2RyaXZlcl9tYXN0ZXIoRFJJVkVSX0lOVEVMKTsKIAotCQlkYXRhLmRldmlk
ID0gaW50ZWxfZ2V0X2RybV9kZXZpZChkYXRhLmRybV9mZCk7CisJZGF0YS5kZXZpZCA9IGludGVs
X2dldF9kcm1fZGV2aWQoZGF0YS5kcm1fZmQpOwogCi0JCWttc3Rlc3Rfc2V0X3Z0X2dyYXBoaWNz
X21vZGUoKTsKKwlrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2RlKCk7CiAKLQkJaWd0X3JlcXVp
cmVfcGlwZV9jcmMoZGF0YS5kcm1fZmQpOworCWlndF9yZXF1aXJlX3BpcGVfY3JjKGRhdGEuZHJt
X2ZkKTsKIAotCQlpZ3RfZGlzcGxheV9yZXF1aXJlKCZkYXRhLmRpc3BsYXksIGRhdGEuZHJtX2Zk
KTsKLQl9CisJaWd0X2Rpc3BsYXlfcmVxdWlyZSgmZGF0YS5kaXNwbGF5LCBkYXRhLmRybV9mZCk7
CiAKIAlydW5fdGVzdCgmZGF0YSk7CiAKLQlpZ3RfZml4dHVyZSB7Ci0JCWlndF9kaXNwbGF5X2Zp
bmkoJmRhdGEuZGlzcGxheSk7Ci0JfQorCWlndF9kaXNwbGF5X2ZpbmkoJmRhdGEuZGlzcGxheSk7
CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
