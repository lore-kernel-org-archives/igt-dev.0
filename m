Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B39886E073
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Oct 2020 23:12:18 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 23 Oct 2020 16:11:51 -0700
Message-Id: <20201023231151.383909-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Skip frontbuffer test in
 TGL
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

RHVlIHRoZSBjb21taXQgNzFjMWE0OTk4MzIwICgiZHJtL2k5MTUvdGdsL3BzcjogRml4IGdsaXRj
aGVzIHdoZW4KZG9pbmcgZnJvbnRidWZmZXIgbW9kaWZpY2F0aW9ucyIpLCBmcm9udGJ1ZmZlciB0
ZXN0IGlzIGV4cGVjdGVkIHRvCmZhaWwgb24gVEdMLCBzbyBoZXJlIHNraXBpbmcgdGhpcyB0ZXN0
IG9uIFRHTC4KV2hlbiBQU1IgaXNzdWVzIGlzIGZpeGVkIHRoZSBwYXRjaCBhYm92ZSB3aWxsIGJl
IHJldmVydGVkIGFuZCB3ZQpjYW4gcmV2ZXJ0IHRoaXMgc2tpcCB0b28uCgpDYzogR3dhbi1neWVv
bmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBS
b2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNy
Ml9zdS5jIHwgNSArKysrKwogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL3Rlc3RzL2ttc19wc3IyX3N1LmMgYi90ZXN0cy9rbXNfcHNyMl9zdS5jCmluZGV4IGQ1
NDlkOWEzMS4uZDU1NDA1MmYwIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfcHNyMl9zdS5jCisrKyBi
L3Rlc3RzL2ttc19wc3IyX3N1LmMKQEAgLTI3OSw2ICsyNzksMTEgQEAgaWd0X21haW4KIAogCWZv
ciAoZGF0YS5vcCA9IFBBR0VfRkxJUDsgZGF0YS5vcCA8IExBU1Q7IGRhdGEub3ArKykgewogCQlp
Z3Rfc3VidGVzdF9mKCIlcyIsIG9wX3N0cihkYXRhLm9wKSkgeworCQkJaWYgKGRhdGEub3AgPT0g
RlJPTlRCVUZGRVIpIHsKKwkJCQljb25zdCB1aW50MTZfdCBkZXZpZCA9IGludGVsX2dldF9kcm1f
ZGV2aWQoZGF0YS5kcm1fZmQpOworCQkJCWlndF9yZXF1aXJlKCFJU19USUdFUkxBS0UoZGV2aWQp
KTsKKwkJCX0KKwogCQkJcHJlcGFyZSgmZGF0YSk7CiAJCQlydW4oJmRhdGEpOwogCQkJY2xlYW51
cCgmZGF0YSk7Ci0tIAoyLjI5LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0
LWRldgo=
