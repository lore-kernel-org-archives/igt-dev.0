Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon,  2 Jul 2018 10:07:13 +0100
Message-Id: <20180702090727.7721-3-chris@chris-wilson.co.uk>
In-Reply-To: <20180702090727.7721-1-chris@chris-wilson.co.uk>
References: <20180702090727.7721-1-chris@chris-wilson.co.uk>
Subject: [Intel-gfx] [PATCH i-g-t 03/17] igt/gem_set_tiling_vs_pwrite: Show
 the erroneous value
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
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
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KSW50ZWwtZ2Z4IG1h
aWxpbmcgbGlzdApJbnRlbC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaW50ZWwtZ2Z4Cg==
