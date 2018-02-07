Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C13A16E12B
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Feb 2018 14:22:21 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Wed,  7 Feb 2018 16:22:04 +0200
Message-Id: <20180207142207.19864-1-arkadiusz.hiler@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/4] kms_plane: Remove redundant modeset
 after CRC capture
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

RnJvbTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgoKVGhlIG51bGwgbW9kZXNldCBh
ZnRlciBjYXB0dXJpbmcgdGhlIENSQyBpcyByZWR1bmRhbnQ7IGRldGFjaGluZyB0aGUgRkIKZnJv
bSB0aGUgcGxhbmUgaXMgZW5vdWdoIGZvciB0aGUgbmV4dCBtb2Rlc2V0IHRvIHdvcmsgcHJvcGVy
bHkuIFRoaXMKc3BlZWQgdGhpbmdzIHVwIGVzcGVjaWFsbHkgb24gc2xvdyBwYW5lbHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBB
cmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21z
X3BsYW5lLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUuYwppbmRleCA1NGJjZmZjMS4u
MDdkNWZmZTcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZS5jCisrKyBiL3Rlc3RzL2ttc19w
bGFuZS5jCkBAIC04OCw3ICs4OCw2IEBAIHRlc3RfZ3JhYl9jcmMoZGF0YV90ICpkYXRhLCBpZ3Rf
b3V0cHV0X3QgKm91dHB1dCwgZW51bSBwaXBlIHBpcGUsCiAJaWd0X3BpcGVfY3JjX2NvbGxlY3Rf
Y3JjKGRhdGEtPnBpcGVfY3JjLCBjcmMpOwogCiAJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCBO
VUxMKTsKLQlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3BsYXkpOwogCiAJaWd0X3JlbW92
ZV9mYihkYXRhLT5kcm1fZmQsICZmYik7CiAKLS0gCjIuMTQuMwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
