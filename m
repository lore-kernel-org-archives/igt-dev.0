Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Sat, 7 Jul 2018 20:22:52 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <40642b983962135de1e7a13a25c63e6803c22410.1531005542.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1531005542.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1531005542.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 3/7] Fix comparison that always evaluates to
 false
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
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, gustavo@padovan.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBjb21taXQgZml4IHRoZSBHQ0Mgd2FybmluZzoKCndhcm5pbmc6IGJpdHdpc2UgY29tcGFy
aXNvbiBhbHdheXMgZXZhbHVhdGVzIHRvIGZhbHNlClstV3RhdXRvbG9naWNhbC1jb21wYXJlXQog
IH0gZWxzZSBpZiAoKHZhbCAmIERQTExCX01PREVfTFZEUykgPT0gRFBMTEJfTU9ERV9EQUNfU0VS
SUFMKSB7CgpUaGUgZmlyc3QgY29tcGFyaXNvbiBhbHJlYWR5IGNoZWNrcyBEUExMQl9NT0RFX0xW
RFMsIGluIHRoaXMgc2Vuc2UsIHRoZQpzZWNvbmQgJ2lmJyBjb25kaXRpb24gYWx3YXlzIHdpbGwg
YmUgZmFsc2UuIFRoaXMgY29tbWl0IGNoYW5nZXMgdGhlCmNvbXBhcmlzb24gdG8gRFBMTEJfTU9E
RV9EQUNfU0VSSUFMLgoKU2lnbmVkLW9mZi1ieTogUm9kcmlnbyBTaXF1ZWlyYSA8cm9kcmlnb3Np
cXVlaXJhbWVsb0BnbWFpbC5jb20+Ci0tLQogdG9vbHMvaW50ZWxfcmVnX2RlY29kZS5jIHwgMiAr
LQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0t
Z2l0IGEvdG9vbHMvaW50ZWxfcmVnX2RlY29kZS5jIGIvdG9vbHMvaW50ZWxfcmVnX2RlY29kZS5j
CmluZGV4IGYzYzdkNzRhLi41YTYzMmUwOSAxMDA2NDQKLS0tIGEvdG9vbHMvaW50ZWxfcmVnX2Rl
Y29kZS5jCisrKyBiL3Rvb2xzL2ludGVsX3JlZ19kZWNvZGUuYwpAQCAtMTI3Nyw3ICsxMjc3LDcg
QEAgREVCVUdTVFJJTkcoaXJvbmxha2VfZGVidWdfcGNoX2RwbGwpCiAJCQlwMiA9ICJEaXYgNyI7
CiAJCWVsc2UKIAkJCXAyID0gIkRpdiAxNCI7Ci0JfSBlbHNlIGlmICgodmFsICYgRFBMTEJfTU9E
RV9MVkRTKSA9PSBEUExMQl9NT0RFX0RBQ19TRVJJQUwpIHsKKwl9IGVsc2UgaWYgKCh2YWwgJiBE
UExMQl9NT0RFX0RBQ19TRVJJQUwpID09IERQTExCX01PREVfREFDX1NFUklBTCkgewogCQltb2Rl
ID0gIk5vbi1MVkRTIjsKIAkJaWYgKHZhbCAmIERQTExfREFDX1NFUklBTF9QMl9DTE9DS19ESVZf
NSkKIAkJCXAyID0gIkRpdiA1IjsKLS0gCjIuMTguMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
