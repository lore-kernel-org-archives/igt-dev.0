Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 270826E600
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Jun 2018 18:32:29 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Tue, 26 Jun 2018 19:32:01 +0100
Message-Id: <20180626183206.22761-3-chris@chris-wilson.co.uk>
In-Reply-To: <20180626183206.22761-1-chris@chris-wilson.co.uk>
References: <20180626183206.22761-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 3/8] igt/gem_set_tiling_vs_pwrite: Show the
 erroneous value
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
Cc: mika.kuoppala@intel.com, tvrtko.ursulin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMvZ2VtX3NldF90aWxpbmdfdnNfcHdyaXRlLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
Z2VtX3NldF90aWxpbmdfdnNfcHdyaXRlLmMgYi90ZXN0cy9nZW1fc2V0X3RpbGluZ192c19wd3Jp
dGUuYwppbmRleCAwMDZlZGZlNGUuLmYwMTI2YjY0OCAxMDA2NDQKLS0tIGEvdGVzdHMvZ2VtX3Nl
dF90aWxpbmdfdnNfcHdyaXRlLmMKKysrIGIvdGVzdHMvZ2VtX3NldF90aWxpbmdfdnNfcHdyaXRl
LmMKQEAgLTc1LDcgKzc1LDcgQEAgaWd0X3NpbXBsZV9tYWluCiAJbWVtc2V0KGRhdGEsIDAsIE9C
SkVDVF9TSVpFKTsKIAlnZW1fcmVhZChmZCwgaGFuZGxlLCAwLCBkYXRhLCBPQkpFQ1RfU0laRSk7
CiAJZm9yIChpID0gMDsgaSA8IE9CSkVDVF9TSVpFLzQ7IGkrKykKLQkJaWd0X2Fzc2VydChpID09
IGRhdGFbaV0pOworCQlpZ3RfYXNzZXJ0X2VxX3UzMihkYXRhW2ldLCBpKTsKIAogCS8qIHRvdWNo
IGl0IGJlZm9yZSBjaGFuZ2luZyB0aGUgdGlsaW5nLCBzbyB0aGF0IHRoZSBmZW5jZSBzdGlja3Mg
YXJvdW5kICovCiAJZ2VtX3NldF9kb21haW4oZmQsIGhhbmRsZSwgSTkxNV9HRU1fRE9NQUlOX0dU
VCwgSTkxNV9HRU1fRE9NQUlOX0dUVCk7CkBAIC04OCw3ICs4OCw3IEBAIGlndF9zaW1wbGVfbWFp
bgogCW1lbXNldChkYXRhLCAwLCBPQkpFQ1RfU0laRSk7CiAJZ2VtX3JlYWQoZmQsIGhhbmRsZSwg
MCwgZGF0YSwgT0JKRUNUX1NJWkUpOwogCWZvciAoaSA9IDA7IGkgPCBPQkpFQ1RfU0laRS80OyBp
KyspCi0JCWlndF9hc3NlcnQoaSA9PSBkYXRhW2ldKTsKKwkJaWd0X2Fzc2VydF9lcV91MzIoZGF0
YVtpXSwgaSk7CiAKIAltdW5tYXAocHRyLCBPQkpFQ1RfU0laRSk7CiAKLS0gCjIuMTguMAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWls
aW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
