Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A67A26E43D
 for <igt-dev@lists.freedesktop.org>; Tue,  2 Apr 2019 16:33:57 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Tue,  2 Apr 2019 19:33:45 +0300
Message-Id: <20190402163348.4680-3-ville.syrjala@linux.intel.com>
In-Reply-To: <20190402163348.4680-1-ville.syrjala@linux.intel.com>
References: <20190402163348.4680-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/6] tests/kms_color: Reuse some already
 compute values
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IGFscmVhZHkgY29tcHV0ZSB0aGUgbHV0X3NpemUqZW50cnlfc2l6ZSBzbyBsZXQncyByZXVzZSB0
aG9zZQp3aGVuIGFsbG9jYXRpbmcgdGhlIExVVHMuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJq
w6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19jb2xv
ci5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19jb2xvci5jIGIvdGVzdHMva21zX2NvbG9yLmMK
aW5kZXggNDNlNTlkZDQyYjBiLi5jNjViYjg4Y2Q3ZGMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19j
b2xvci5jCisrKyBiL3Rlc3RzL2ttc19jb2xvci5jCkBAIC0xMDc5LDggKzEwNzksOCBAQCBpbnZh
bGlkX2x1dF9zaXplcyhkYXRhX3QgKmRhdGEpCiAJc2l6ZV90IGRlZ2FtbWFfbHV0X3NpemUgPSBk
YXRhLT5kZWdhbW1hX2x1dF9zaXplICogc2l6ZW9mKHN0cnVjdCBkcm1fY29sb3JfbHV0KTsKIAlz
aXplX3QgZ2FtbWFfbHV0X3NpemUgPSBkYXRhLT5nYW1tYV9sdXRfc2l6ZSAqIHNpemVvZihzdHJ1
Y3QgZHJtX2NvbG9yX2x1dCk7CiAKLQlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqZGVnYW1tYV9sdXQg
PSBtYWxsb2MoZGF0YS0+ZGVnYW1tYV9sdXRfc2l6ZSAqIHNpemVvZihzdHJ1Y3QgZHJtX2NvbG9y
X2x1dCkgKiAyKTsKLQlzdHJ1Y3QgZHJtX2NvbG9yX2x1dCAqZ2FtbWFfbHV0ID0gbWFsbG9jKGRh
dGEtPmdhbW1hX2x1dF9zaXplICogc2l6ZW9mKHN0cnVjdCBkcm1fY29sb3JfbHV0KSAqIDIpOwor
CXN0cnVjdCBkcm1fY29sb3JfbHV0ICpkZWdhbW1hX2x1dCA9IG1hbGxvYyhkZWdhbW1hX2x1dF9z
aXplICogMik7CisJc3RydWN0IGRybV9jb2xvcl9sdXQgKmdhbW1hX2x1dCA9IG1hbGxvYyhnYW1t
YV9sdXRfc2l6ZSAqIDIpOwogCiAJaWd0X2Rpc3BsYXlfY29tbWl0MihkaXNwbGF5LCBkaXNwbGF5
LT5pc19hdG9taWMgPyBDT01NSVRfQVRPTUlDIDogQ09NTUlUX0xFR0FDWSk7CiAKLS0gCjIuMTku
MgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
