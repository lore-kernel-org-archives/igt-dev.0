Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39556E0DB
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Mar 2018 16:52:18 +0000 (UTC)
From: Imre Deak <imre.deak@intel.com>
Date: Tue,  6 Mar 2018 18:52:12 +0200
Message-Id: <20180306165215.16490-2-imre.deak@intel.com>
In-Reply-To: <20180306165215.16490-1-imre.deak@intel.com>
References: <20180306165215.16490-1-imre.deak@intel.com>
Subject: [igt-dev] [PATCH v2 1/4] kms_plane: Remove redundant modeset after
 CRC capture
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

VGhlIG51bGwgbW9kZXNldCBhZnRlciBjYXB0dXJpbmcgdGhlIENSQyBpcyByZWR1bmRhbnQ7IGRl
dGFjaGluZyB0aGUgRkIKZnJvbSB0aGUgcGxhbmUgaXMgZW5vdWdoIGZvciB0aGUgbmV4dCBtb2Rl
c2V0IHRvIHdvcmsgcHJvcGVybHkuIFRoaXMKc3BlZWQgdGhpbmdzIHVwIGVzcGVjaWFsbHkgb24g
c2xvdyBwYW5lbHMuCgpTaWduZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5j
b20+ClJldmlld2VkLWJ5OiBBcmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5j
b20+Ci0tLQogdGVzdHMva21zX3BsYW5lLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUu
YwppbmRleCAyMzE3M2I5Ni4uMWQxYmMxOTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZS5j
CisrKyBiL3Rlc3RzL2ttc19wbGFuZS5jCkBAIC04OCw3ICs4OCw2IEBAIHRlc3RfZ3JhYl9jcmMo
ZGF0YV90ICpkYXRhLCBpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgZW51bSBwaXBlIHBpcGUsCiAJaWd0
X3BpcGVfY3JjX2NvbGxlY3RfY3JjKGRhdGEtPnBpcGVfY3JjLCBjcmMpOwogCiAJaWd0X3BsYW5l
X3NldF9mYihwcmltYXJ5LCBOVUxMKTsKLQlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3Bs
YXkpOwogCiAJaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZmYik7CiAKLS0gCjIuMTMuMgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
