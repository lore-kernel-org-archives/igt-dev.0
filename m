Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CBDD893AB
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Feb 2019 19:27:53 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 21 Feb 2019 11:27:41 -0800
Message-Id: <20190221192745.31178-2-antonio.argenziano@intel.com>
In-Reply-To: <20190221192745.31178-1-antonio.argenziano@intel.com>
References: <20190221192745.31178-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC 1/5] tests/prime_self_import: Swap gtt mapping for
 cpu
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

VGhlIHRlc3QgdXNlcyBndHQgbWFwcGluZyB0byBjaGVjayB0d28gQk9zIGhhdmUgdGhlIHNhbWUg
Y29udGVudCwgc2luY2UKaXQgc2VlbXMgdGhlcmUgaXMgbm8gY29udGVudGlvbiBvbiB0aGUgQk9z
IHVzZSBjcHUgbWFwcGluZyB0byBtYWtlIGl0CmNvbXBhdGlibGUgd2l0aCBwbGF0Zm9ybXMgdGhh
dCBkbyBub3QgaGF2ZSBhIG1hcHBhYmxlIGFwZXJ0dXJlLgoKU2lnbmVkLW9mZi1ieTogQW50b25p
byBBcmdlbnppYW5vIDxhbnRvbmlvLmFyZ2Vuemlhbm9AaW50ZWwuY29tPgotLS0KIHRlc3RzL3By
aW1lX3NlbGZfaW1wb3J0LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcHJpbWVfc2VsZl9pbXBvcnQu
YyBiL3Rlc3RzL3ByaW1lX3NlbGZfaW1wb3J0LmMKaW5kZXggOGM0ZjUzMjEuLjkwNWZmZmZiIDEw
MDY0NAotLS0gYS90ZXN0cy9wcmltZV9zZWxmX2ltcG9ydC5jCisrKyBiL3Rlc3RzL3ByaW1lX3Nl
bGZfaW1wb3J0LmMKQEAgLTU5LDggKzU5LDggQEAgY2hlY2tfYm8oaW50IGZkMSwgdWludDMyX3Qg
aGFuZGxlMSwgaW50IGZkMiwgdWludDMyX3QgaGFuZGxlMikKIAljaGFyICpwdHIxLCAqcHRyMjsK
IAlpbnQgaTsKIAotCXB0cjEgPSBnZW1fbW1hcF9fZ3R0KGZkMSwgaGFuZGxlMSwgQk9fU0laRSwg
UFJPVF9SRUFEIHwgUFJPVF9XUklURSk7Ci0JcHRyMiA9IGdlbV9tbWFwX19ndHQoZmQyLCBoYW5k
bGUyLCBCT19TSVpFLCBQUk9UX1JFQUQgfCBQUk9UX1dSSVRFKTsKKwlwdHIxID0gZ2VtX21tYXBf
X2NwdShmZDEsIGhhbmRsZTEsIDAsIEJPX1NJWkUsIFBST1RfUkVBRCB8IFBST1RfV1JJVEUpOwor
CXB0cjIgPSBnZW1fbW1hcF9fY3B1KGZkMiwgaGFuZGxlMiwgMCwgQk9fU0laRSwgUFJPVF9SRUFE
IHwgUFJPVF9XUklURSk7CiAKIAkvKiBjaGVjayB3aGV0aGVyIGl0J3Mgc3RpbGwgb3VyIG9sZCBv
YmplY3QgZmlyc3QuICovCiAJZm9yIChpID0gMDsgaSA8IEJPX1NJWkU7IGkrKykgewotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
