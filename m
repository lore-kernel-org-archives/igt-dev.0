Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3818898BE
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Apr 2021 02:28:05 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 14 Apr 2021 05:27:49 +0300
Message-Id: <20210414022754.31710-4-ville.syrjala@linux.intel.com>
In-Reply-To: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
References: <20210414022754.31710-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/8] tools/intel_watermark: Deal with TGL
 planes
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRH
TCBoYXMgdGhlIHNhbWUgYW1vdW50IG9mIHBsYW5lcyBhcyBJQ0wuIE1ha2UgaW50ZWxfd2F0ZXJt
YXJrCmF3YXJlIG9mIHRoYXQgZmFjdC4KCnYyOiBVc2UgaW50ZWxfZ2VuKCkKClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
dG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMgfCAxMiArKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdG9vbHMvaW50
ZWxfd2F0ZXJtYXJrLmMgYi90b29scy9pbnRlbF93YXRlcm1hcmsuYwppbmRleCAzOWFhZjlmYmUw
NTUuLjRhNTc2NGI1OTY3NyAxMDA2NDQKLS0tIGEvdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMKKysr
IGIvdG9vbHMvaW50ZWxfd2F0ZXJtYXJrLmMKQEAgLTEzMyw5ICsxMzMsMTEgQEAgc3RhdGljIGNo
YXIgZW5kaXNfYXN0KGJvb2wgZW5hYmxlZCkKIAogc3RhdGljIGludCBza2xfbnVtX3BsYW5lcyh1
aW50MzJfdCBkLCBpbnQgcGlwZSkKIHsKLQlpZiAoSVNfR0VOMTEoZCkpCisJaW50IGdlbiA9IGlu
dGVsX2dlbihkKTsKKworCWlmIChnZW4gPj0gMTEpCiAJCXJldHVybiA4OwotCWVsc2UgaWYgKElT
X0dFTjEwKGQpIHx8IElTX0dFTUlOSUxBS0UoZCkpCisJZWxzZSBpZiAoZ2VuID09IDEwIHx8IElT
X0dFTUlOSUxBS0UoZCkpCiAJCXJldHVybiA1OwogCWVsc2UgaWYgKElTX0JST1hUT04oZCkpCiAJ
CXJldHVybiBwaXBlID09IDIgPyA0IDogNTsKQEAgLTE0NSw5ICsxNDcsMTEgQEAgc3RhdGljIGlu
dCBza2xfbnVtX3BsYW5lcyh1aW50MzJfdCBkLCBpbnQgcGlwZSkKIAogc3RhdGljIGludCBza2xf
bWF4X3BsYW5lcyh1aW50MzJfdCBkKQogewotCWlmIChJU19HRU4xMShkKSkKKwlpbnQgZ2VuID0g
aW50ZWxfZ2VuKGQpOworCisJaWYgKGdlbiA+PSAxMSkKIAkJcmV0dXJuIDg7Ci0JZWxzZSBpZiAo
SVNfR0VOMTAoZCkgfHwgSVNfR0VNSU5JTEFLRShkKSB8fCBJU19CUk9YVE9OKGQpKQorCWVsc2Ug
aWYgKGdlbiA9PSAxMCB8fCBJU19HRU1JTklMQUtFKGQpIHx8IElTX0JST1hUT04oZCkpCiAJCXJl
dHVybiA1OwogCWVsc2UKIAkJcmV0dXJuIDQ7Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
