Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27C2C891CA
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Sep 2018 16:28:12 +0000 (UTC)
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Date: Wed,  5 Sep 2018 19:27:54 +0300
Message-Id: <20180905162758.29245-2-gwan-gyeong.mun@intel.com>
In-Reply-To: <20180905162758.29245-1-gwan-gyeong.mun@intel.com>
References: <20180306165215.16490-2-imre.deak@intel.com>
 <20180905162758.29245-1-gwan-gyeong.mun@intel.com>
Subject: [igt-dev] [PATCH i-g-t v3 1/5] kms_plane: Remove redundant modeset
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
Cc: juha-pekka.heikkila@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgoKVGhlIG51bGwgbW9kZXNldCBh
ZnRlciBjYXB0dXJpbmcgdGhlIENSQyBpcyByZWR1bmRhbnQ7IGRldGFjaGluZyB0aGUgRkIKZnJv
bSB0aGUgcGxhbmUgaXMgZW5vdWdoIGZvciB0aGUgbmV4dCBtb2Rlc2V0IHRvIHdvcmsgcHJvcGVy
bHkuIFRoaXMKc3BlZWQgdGhpbmdzIHVwIGVzcGVjaWFsbHkgb24gc2xvdyBwYW5lbHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBB
cmthZGl1c3ogSGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21z
X3BsYW5lLmMgfCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX3BsYW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUuYwppbmRleCAzOTk5ZGRlOC4u
YWNlYWU1OTEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZS5jCisrKyBiL3Rlc3RzL2ttc19w
bGFuZS5jCkBAIC04OCw3ICs4OCw2IEBAIHRlc3RfZ3JhYl9jcmMoZGF0YV90ICpkYXRhLCBpZ3Rf
b3V0cHV0X3QgKm91dHB1dCwgZW51bSBwaXBlIHBpcGUsCiAJaWd0X3BpcGVfY3JjX2NvbGxlY3Rf
Y3JjKGRhdGEtPnBpcGVfY3JjLCBjcmMpOwogCiAJaWd0X3BsYW5lX3NldF9mYihwcmltYXJ5LCBO
VUxMKTsKLQlpZ3RfZGlzcGxheV9jb21taXQoJmRhdGEtPmRpc3BsYXkpOwogCiAJaWd0X3JlbW92
ZV9mYihkYXRhLT5kcm1fZmQsICZmYik7CiAKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRl
dkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
