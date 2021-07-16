Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC67A6E9A5
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Jul 2021 14:44:54 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Jul 2021 17:44:29 +0300
Message-Id: <20210716144442.31962-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
References: <20210716144442.31962-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/16] tests/kms_plane_scaling: Use
 igt_rotation_90_or_270()
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
cGxhY2UgdGhlIGhhbmQgcm9sbGVkIDkwLzI3MCByb3RhdGlvbiBjaGVjayB3aXRoCmlndF9yb3Rh
dGlvbl85MF9vcl8yNzAoKS4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMgYi90ZXN0cy9rbXNfcGxhbmVfc2Nh
bGluZy5jCmluZGV4IDNmNDc3MzNlZGFkMi4uODA5NDYzYTcxNTgzIDEwMDY0NAotLS0gYS90ZXN0
cy9rbXNfcGxhbmVfc2NhbGluZy5jCisrKyBiL3Rlc3RzL2ttc19wbGFuZV9zY2FsaW5nLmMKQEAg
LTE2Niw3ICsxNjYsNyBAQCBzdGF0aWMgYm9vbCBjYW5fcm90YXRlKGRhdGFfdCAqZCwgdW5zaWdu
ZWQgZm9ybWF0LCB1aW50NjRfdCB0aWxpbmcsCiAJCXJldHVybiB0cnVlOwogCiAJaWYgKGludGVs
X2Rpc3BsYXlfdmVyKGQtPmRldmlkKSA+PSAxMyAmJgotCQkocm90ID09IElHVF9ST1RBVElPTl85
MCB8fCByb3QgPT0gSUdUX1JPVEFUSU9OXzI3MCkpCisJCWlndF9yb3RhdGlvbl85MF9vcl8yNzAo
cm90KSkKIAkJcmV0dXJuIGZhbHNlOwogCiAJc3dpdGNoIChmb3JtYXQpIHsKLS0gCjIuMzEuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
