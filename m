Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038CD6ECA7
 for <igt-dev@lists.freedesktop.org>; Fri, 16 Apr 2021 17:53:22 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Fri, 16 Apr 2021 20:53:08 +0300
Message-Id: <20210416175312.25190-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
References: <20210416175312.25190-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/6] tests/kms_flip_scaled_crc: Don't leak
 the fbs between subtests
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNs
ZWFuIHVwIHRoZSBmYnMgcHJvcGVybHkgYmVmb3JlIHN0YXJ0aW5nIHRoZSBuZXh0IHN1YnRlc3Qs
IG90aGVyd2lzZQppdCdsbCBrZWVwIHVzaW5nIHRoZSBvbGQgZmIgYW5kIG5vdCBldmVuIHRlc3Rp
bmcgd2hhdCBpdCBjbGFpbXMgdG8gYmUKdGVzdGluZy4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5
cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2Zs
aXBfc2NhbGVkX2NyYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2ZsaXBfc2NhbGVkX2NyYy5jIGIv
dGVzdHMva21zX2ZsaXBfc2NhbGVkX2NyYy5jCmluZGV4IDgxNTNmYjg5MGExNy4uMmIzMDg3ZWI3
YjU0IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZmxpcF9zY2FsZWRfY3JjLmMKKysrIGIvdGVzdHMv
a21zX2ZsaXBfc2NhbGVkX2NyYy5jCkBAIC0yMjMsMTEgKzIyMywxMSBAQCBpZ3RfbWFpbgogCWZv
ciAoaW50IGluZGV4ID0gMDsgaW5kZXggPCBBUlJBWV9TSVpFKGZsaXBfc2NlbmFyaW9fdGVzdCk7
IGluZGV4KyspIHsKIAkJaWd0X2Rlc2NyaWJlKGZsaXBfc2NlbmFyaW9fdGVzdFtpbmRleF0uZGVz
Y3JpYmUpOwogCQlpZ3Rfc3VidGVzdChmbGlwX3NjZW5hcmlvX3Rlc3RbaW5kZXhdLm5hbWUpIHsK
KwkJCWZyZWVfZmJzKCZkYXRhKTsKIAkJCWZvcl9lYWNoX3BpcGVfd2l0aF9zaW5nbGVfb3V0cHV0
KCZkYXRhLmRpc3BsYXksIHBpcGUsCiAJCQkJCQkJIG91dHB1dCkKIAkJCQl0ZXN0X2ZsaXBfdG9f
c2NhbGVkKCZkYXRhLCBpbmRleCwgcGlwZSwgb3V0cHV0KTsKIAotCQkJZnJlZV9mYnMoJmRhdGEp
OwogCQl9CiAJfQogCWlndF9maXh0dXJlIHsKLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
