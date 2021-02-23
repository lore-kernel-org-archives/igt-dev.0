Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B116E1D3
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Feb 2021 21:09:53 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue, 23 Feb 2021 23:09:47 +0200
Message-Id: <20210223210950.13515-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_concurrent: Actually seed the
 rng
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCB0aGUgbWlzc2luZyBzcmFuZCgpIGNhbGwgdG8gYWN0dWFsbHkgc2VlZCB0aGUgcmFuZG9tIG51
bWJlcgpnZW5lcmF0b3IuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jb25jdXJyZW50LmMgfCAyICsr
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21z
X2NvbmN1cnJlbnQuYyBiL3Rlc3RzL2ttc19jb25jdXJyZW50LmMKaW5kZXggNTczNjMxZTBmN2Jh
Li5iZDc0MTZmZGE3NjAgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19jb25jdXJyZW50LmMKKysrIGIv
dGVzdHMva21zX2NvbmN1cnJlbnQuYwpAQCAtMjk0LDYgKzI5NCw4IEBAIHJ1bl90ZXN0KGRhdGFf
dCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsIGlndF9vdXRwdXRfdCAqb3V0cHV0KQogCQlpZ3RfaW5m
bygiVGVzdGluZyByZXNvbHV0aW9uIHdpdGggY29ubmVjdG9yICVzIHVzaW5nIHBpcGUgJXMgd2l0
aCBzZWVkICVkXG4iLAogCQkJIGlndF9vdXRwdXRfbmFtZShvdXRwdXQpLCBrbXN0ZXN0X3BpcGVf
bmFtZShwaXBlKSwgb3B0LnNlZWQpOwogCisJCXNyYW5kKG9wdC5zZWVkKTsKKwogCQl0ZXN0X2lu
aXQoZGF0YSwgcGlwZSwgbl9wbGFuZXMsIG91dHB1dCk7CiAKIAkJaWd0X2ZvcmsoY2hpbGQsIDEp
IHsKLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
