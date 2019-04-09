Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D284589159
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Apr 2019 12:29:30 +0000 (UTC)
From: Mika Kahola <mika.kahola@intel.com>
Date: Tue,  9 Apr 2019 15:29:30 +0300
Message-Id: <20190409122930.4262-1-mika.kahola@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_scaling: Check supported
 pixel format
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

TGV0J3MgYWRkIGEgY2hlY2sgZm9yIHN1cHBvcnRlZCBwaXhlbCBmb3JtYXQuIE90aGVyd2lzZSwg
d2UgZmFpbCB0aGUgdGVzdCwKZm9yIGV4YW1wbGUsIHdpdGggdGhlIGZvbGxvd2luZyBlcnJvciBt
ZXNzYWdlCgoiW2RybTppbnRlbF9mcmFtZWJ1ZmZlcl9pbml0IFtpOTE1XV0gdW5zdXBwb3J0ZWQg
cGl4ZWwgZm9ybWF0IFkyMTAgbGl0dGxlLWVuZGlhbgooMHgzMDMxMzI1OSkgLyBtb2RpZmllciAw
eDEwMDAwMDAwMDAwMDAwMyIKCkJ1Z3ppbGxhOiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3Jn
L3Nob3dfYnVnLmNnaT9pZD0xMTAzNjkKU2lnbmVkLW9mZi1ieTogTWlrYSBLYWhvbGEgPG1pa2Eu
a2Fob2xhQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIHwgMyArKy0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS90ZXN0cy9rbXNfcGxhbmVfc2NhbGluZy5jIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcu
YwppbmRleCBiYjE0YjJjZC4uZTg0M2JmODYgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19wbGFuZV9z
Y2FsaW5nLmMKKysrIGIvdGVzdHMva21zX3BsYW5lX3NjYWxpbmcuYwpAQCAtMjMyLDcgKzIzMiw4
IEBAIHN0YXRpYyB2b2lkIHRlc3Rfc2NhbGVyX3dpdGhfcGl4ZWxfZm9ybWF0X3BpcGUoZGF0YV90
ICpkLCBlbnVtIHBpcGUgcGlwZSwgaWd0X291CiAJCQlmb3IgKGludCBqID0gMDsgaiA8IHBsYW5l
LT5kcm1fcGxhbmUtPmNvdW50X2Zvcm1hdHM7IGorKykgewogCQkJCXVpbnQzMl90IGZvcm1hdCA9
IHBsYW5lLT5kcm1fcGxhbmUtPmZvcm1hdHNbal07CiAKLQkJCQlpZiAoaWd0X2ZiX3N1cHBvcnRl
ZF9mb3JtYXQoZm9ybWF0KSkKKwkJCQlpZiAoaWd0X2ZiX3N1cHBvcnRlZF9mb3JtYXQoZm9ybWF0
KSAmJgorCQkJCSAgICBpZ3RfcGxhbmVfaGFzX2Zvcm1hdF9tb2QocGxhbmUsIGZvcm1hdCwgdGls
aW5nKSkKIAkJCQkJY2hlY2tfc2NhbGluZ19waXBlX3BsYW5lX3JvdChkLCBwbGFuZSwKIAkJCQkJ
CQkJICAgICBmb3JtYXQsIHRpbGluZywKIAkJCQkJCQkJICAgICBwaXBlLCBvdXRwdXQsIElHVF9S
T1RBVElPTl8wKTsKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9p
Z3QtZGV2
