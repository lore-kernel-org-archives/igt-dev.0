Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B76326E5D6
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 10:38:47 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 21 Feb 2018 11:38:42 +0100
Message-Id: <20180221103844.46709-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180221103844.46709-1-maarten.lankhorst@linux.intel.com>
References: <20180221103844.46709-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_rmfb: Use
 for_each_pipe_with_single_output.
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

QSBzaW5nbGUgb3V0cHV0IG9uIGV2ZXJ5IHBpcGUgd2lsbCBkbyBmb3IgdGVzdGluZy4KClNpZ25l
ZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRl
bC5jb20+Ci0tLQogdGVzdHMva21zX3JtZmIuYyB8IDggKystLS0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X3JtZmIuYyBiL3Rlc3RzL2ttc19ybWZiLmMKaW5kZXggYzk3YWRjZWVhNzYxLi5mMzQ2MWNjOTE5
ZTkgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19ybWZiLmMKKysrIGIvdGVzdHMva21zX3JtZmIuYwpA
QCAtMTI5LDE1ICsxMjksMTAgQEAgc3RhdGljIHZvaWQKIHJ1bl9ybWZiX3Rlc3Qoc3RydWN0IHJt
ZmJfZGF0YSAqZGF0YSwgYm9vbCByZW9wZW4pCiB7CiAJaWd0X291dHB1dF90ICpvdXRwdXQ7Ci0J
aW50IHZhbGlkX3Rlc3RzID0gMDsKIAllbnVtIHBpcGUgcGlwZTsKIAotCWZvcl9lYWNoX3BpcGVf
d2l0aF92YWxpZF9vdXRwdXQoJmRhdGEtPmRpc3BsYXksIHBpcGUsIG91dHB1dCkgeworCWZvcl9l
YWNoX3BpcGVfd2l0aF9zaW5nbGVfb3V0cHV0KCZkYXRhLT5kaXNwbGF5LCBwaXBlLCBvdXRwdXQp
CiAJCXRlc3Rfcm1mYihkYXRhLCBvdXRwdXQsIHBpcGUsIHJlb3Blbik7Ci0JCXZhbGlkX3Rlc3Rz
ID0gMTsKLQl9Ci0KLQlpZ3RfcmVxdWlyZV9mKHZhbGlkX3Rlc3RzLCAibm8gdmFsaWQgY3J0Yy9j
b25uZWN0b3IgY29tYmluYXRpb25zIGZvdW5kXG4iKTsKIH0KIAogaWd0X21haW4KQEAgLTE1Miw2
ICsxNDcsNyBAQCBpZ3RfbWFpbgogCQlrbXN0ZXN0X3NldF92dF9ncmFwaGljc19tb2RlKCk7CiAK
IAkJaWd0X2Rpc3BsYXlfaW5pdCgmZGF0YS5kaXNwbGF5LCBkYXRhLmRybV9mZCk7CisJCWlndF9k
aXNwbGF5X3JlcXVpcmVfb3V0cHV0KCZkYXRhLmRpc3BsYXkpOwogCX0KIAogCWlndF9zdWJ0ZXN0
X2YoInJtZmItaW9jdGwiKQotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
