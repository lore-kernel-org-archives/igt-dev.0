Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A0A96E52E
 for <igt-dev@lists.freedesktop.org>; Tue, 24 Mar 2020 20:28:16 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Tue, 24 Mar 2020 13:29:29 -0700
Message-Id: <20200324202930.30231-6-jose.souza@intel.com>
In-Reply-To: <20200324202930.30231-1-jose.souza@intel.com>
References: <20200324202930.30231-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 6/7] DO_NOT_MERGE: Revert
 "tests/kms_frontbuffer_tracking: Enable positive test on linear tiling"
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

UmV2ZXJ0aW5nIHRoaXMgb25lIGFzIHRoZSBrZXJuZWwgcGF0Y2hlcyBkaWQgbm90IGxhbmRlZCB5
ZXQgc28gaXQgd291bGQKY2F1c2UgQ0kgdG8gZmFpbC4KClRoaXMgcmV2ZXJ0cyBjb21taXQgZTEy
ZWZkYTI0MzllMDQ1YWJhNDIzYjJhZjljMjA1ZjYwY2ZhZWNjNi4KClNpZ25lZC1vZmYtYnk6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgNCArLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zyb250YnVm
ZmVyX3RyYWNraW5nLmMgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwppbmRleCAz
NDcyMzkyMi4uZjc3MzNkYTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFj
a2luZy5jCisrKyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCkBAIC0yMTcyLDE0
ICsyMTcyLDEyIEBAIHN0YXRpYyB2b2lkIGZvcm1hdF9kcmF3X3N1YnRlc3QoY29uc3Qgc3RydWN0
IHRlc3RfbW9kZSAqdCkKIAogc3RhdGljIGJvb2wgdGlsaW5nX2lzX3ZhbGlkKGludCBmZWF0dXJl
X2ZsYWdzLCBlbnVtIHRpbGluZ190eXBlIHRpbGluZykKIHsKLQlpbnQgZGV2aWQgPSBpbnRlbF9n
ZXRfZHJtX2RldmlkKGRybS5mZCk7Ci0KIAlpZiAoIShmZWF0dXJlX2ZsYWdzICYgRkVBVFVSRV9G
QkMpKQogCQlyZXR1cm4gdHJ1ZTsKIAogCXN3aXRjaCAodGlsaW5nKSB7CiAJY2FzZSBUSUxJTkdf
TElORUFSOgotCQlyZXR1cm4gQVRfTEVBU1RfR0VOKGRldmlkLCA5KTsKKwkJcmV0dXJuIGZhbHNl
OwogCWNhc2UgVElMSU5HX1g6CiAJY2FzZSBUSUxJTkdfWToKIAkJcmV0dXJuIHRydWU7Ci0tIAoy
LjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
