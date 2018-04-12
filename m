Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0048.outbound.protection.outlook.com [104.47.42.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6596E086
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Apr 2018 21:47:37 +0000 (UTC)
From: <sunpeng.li@amd.com>
Date: Thu, 12 Apr 2018 17:46:41 -0400
Message-ID: <1523569601-2580-1-git-send-email-sunpeng.li@amd.com>
In-Reply-To: <1523569046-612-3-git-send-email-sunpeng.li@amd.com>
References: <1523569046-612-3-git-send-email-sunpeng.li@amd.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/3] tests/kms_color: Do not mask LUT for
 non i915 drivers.
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

RnJvbTogIkxlbyAoU3VucGVuZykgTGkiIDxzdW5wZW5nLmxpQGFtZC5jb20+CgpNYXNraW5nIGFz
c3VtZXMgYSBkaXJlY3QgcmVsYXRpb25zaGlwIGJldHdlZW4gdGhlIHNvZnR3YXJlIExVVApzdHJ1
Y3R1cmUsIGFuZCBoYXJkd2FyZSBMVVQuIFRoaXMgaXMgbm90IGFsd2F5cyB0aGUgY2FzZS4KCk9u
IEFNRCBoYXJkd2FyZSBmb3IgZXhhbXBsZSwgdGhlIGhhcmR3YXJlIExVVCBpcyBjb21wb3NlZCBv
ZgpwaWVjZXdpc2UtbGluZWFyIHNlZ21lbnRzLCB3aXRoIGVuZC1wb2ludCBzcGFjZWQgZXhwb25l
bnRpYWxseSBhbG9uZyB0aGUKWCBheGlzLCB3aGlsZSBzb2Z0d2FyZSBMVVQgaXMgc3BhY2VkIGxp
bmVhcmx5LiBNYXNraW5nIHRoZSBMVVQgZm9yIHRoZQpwdXJwb3NlIG9mIHRydW5jYXRpbmcgdGhl
IHJlc3VsdGluZyBjb2xvcnMgd29uJ3Qgd29yayBoZXJlLgoKU2lnbmVkLW9mZi1ieTogTGVvIChT
dW5wZW5nKSBMaSA8c3VucGVuZy5saUBhbWQuY29tPgoKdjI6IEFkZCBjb21taXQgbWVzc2FnZSBh
bmQgc2lnbiBvZmYuCi0tLQogdGVzdHMva21zX2NvbG9yLmMgfCA3ICsrKysrKy0KIDEgZmlsZSBj
aGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0
cy9rbXNfY29sb3IuYyBiL3Rlc3RzL2ttc19jb2xvci5jCmluZGV4IGMzMTI2OTcuLjFlNTE5MTcg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jb2xvci5jCisrKyBiL3Rlc3RzL2ttc19jb2xvci5jCkBA
IC0xNjUsNyArMTY1LDEyIEBAIHN0YXRpYyBzdHJ1Y3QgX2RybV9jb2xvcl9sdXQgKmNvZWZmc190
b19sdXQoZGF0YV90ICpkYXRhLAogCXN0cnVjdCBfZHJtX2NvbG9yX2x1dCAqbHV0OwogCXVpbnQz
Ml90IGk7CiAJdWludDMyX3QgbWF4X3ZhbHVlID0gKDEgPDwgMTYpIC0gMTsKLQl1aW50MzJfdCBt
YXNrID0gKCgxIDw8IGNvbG9yX2RlcHRoKSAtIDEpIDw8IDg7CisJdWludDMyX3QgbWFzazsKKwor
CWlmIChpc19pOTE1X2RldmljZShkYXRhLT5kcm1fZmQpKQorCQltYXNrID0gKCgxIDw8IGNvbG9y
X2RlcHRoKSAtIDEpIDw8IDg7CisJZWxzZQorCQltYXNrID0gbWF4X3ZhbHVlOwogCiAJbHV0ID0g
bWFsbG9jKHNpemVvZihzdHJ1Y3QgX2RybV9jb2xvcl9sdXQpICogbHV0X3NpemUpOwogCi0tIAoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
