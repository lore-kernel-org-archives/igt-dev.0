Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B0536ECA8
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:53:24 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:53:09 +0300
Message-Id: <20210416175312.25190-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
References: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/kms_flip_scaled_crc: Use
 igt_assert_crc_equal()
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIGhhbmQgcm9sbGVkIGlndF9hc3NlcnRfY3JjX2VxdWFsKCkgd2l0aCB0aGUgcmVh
bAp0aGluZyBzbyB0aGF0IC0tc2tpcC1jcmMtY29tcGFyZSBhY3R1YWxseSB3b3Jrcy4KClNpZ25l
ZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+
Ci0tLQogdGVzdHMva21zX2ZsaXBfc2NhbGVkX2NyYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zs
aXBfc2NhbGVkX2NyYy5jIGIvdGVzdHMva21zX2ZsaXBfc2NhbGVkX2NyYy5jCmluZGV4IDJiMzA4
N2ViN2I1NC4uYjcwYmU2ZjAzYmNlIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZmxpcF9zY2FsZWRf
Y3JjLmMKKysrIGIvdGVzdHMva21zX2ZsaXBfc2NhbGVkX2NyYy5jCkBAIC0xODksNyArMTg5LDcg
QEAgc3RhdGljIHZvaWQgdGVzdF9mbGlwX3RvX3NjYWxlZChkYXRhX3QgKmRhdGEsIHVpbnQzMl90
IGluZGV4LCBlbnVtIHBpcGUgcGlwZSwKIAlpZ3RfYXNzZXJ0KHJlYWQoZGF0YS0+ZHJtX2ZkLCAm
ZXYsIHNpemVvZihldikpID09IHNpemVvZihldikpOwogCiAJaWd0X3BpcGVfY3JjX2dldF9jdXJy
ZW50KGRhdGEtPmRybV9mZCwgZGF0YS0+cGlwZV9jcmMsICZiaWdfY3JjKTsKLQlpZ3RfYXNzZXJ0
KGlndF9jaGVja19jcmNfZXF1YWwoJnNtYWxsX2NyYywgJmJpZ19jcmMpKTsKKwlpZ3RfYXNzZXJ0
X2NyY19lcXVhbCgmc21hbGxfY3JjLCAmYmlnX2NyYyk7CiAKIAlpZ3RfcGlwZV9jcmNfc3RvcChk
YXRhLT5waXBlX2NyYyk7CiAJaWd0X3BpcGVfY3JjX2ZyZWUoZGF0YS0+cGlwZV9jcmMpOwotLSAK
Mi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
