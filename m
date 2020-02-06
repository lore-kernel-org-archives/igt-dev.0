Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D66D26E29A
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 02:09:52 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed,  5 Feb 2020 18:09:44 -0800
Message-Id: <20200206020944.338033-4-jose.souza@intel.com>
In-Reply-To: <20200206020944.338033-1-jose.souza@intel.com>
References: <20200206020944.338033-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] DO_NOT_MERGE: Revert
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
ZXQgc28gaXQgd291bGQKY2F1c2UgQ0kgdG8gZmFpbC4KClRoaXMgcmV2ZXJ0cyBjb21taXQgNGVl
MDVkNDdmN2ZlMGQ5N2E5OWJkYTdmMDhkYjdlOWEzMGRhNjFhNi4KClNpZ25lZC1vZmYtYnk6IEpv
c8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2tt
c19mcm9udGJ1ZmZlcl90cmFja2luZy5jIHwgNCAtLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYyBi
L3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCmluZGV4IDJmZGE5YWI3Li5kNWE2NGE0
ZCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKKysrIGIvdGVz
dHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKQEAgLTIxNjEsMTUgKzIxNjEsMTEgQEAgc3Rh
dGljIHZvaWQgZm9ybWF0X2RyYXdfc3VidGVzdChjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0KQog
CiBzdGF0aWMgYm9vbCB0aWxpbmdfaXNfdmFsaWQoaW50IGZlYXR1cmVfZmxhZ3MsIGVudW0gdGls
ZV90eXBlIHRpbGUpCiB7Ci0JaW50IGRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChkcm0uZmQp
OwotCiAJaWYgKCEoZmVhdHVyZV9mbGFncyAmIEZFQVRVUkVfRkJDKSkKIAkJcmV0dXJuIHRydWU7
CiAKIAlzd2l0Y2ggKHRpbGUpIHsKIAljYXNlIFRJTEVfTElORUFSOgotCQlpZiAoQVRfTEVBU1Rf
R0VOKGRldmlkLCAxMSkpCi0JCQlyZXR1cm4gdHJ1ZTsKIAkJcmV0dXJuIGZhbHNlOwogCWNhc2Ug
VElMRV9YOgogCWNhc2UgVElMRV9ZOgotLSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
