Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127ED6F990
 for <igt-dev@lists.freedesktop.org>; Thu,  6 Feb 2020 02:09:53 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Wed,  5 Feb 2020 18:09:43 -0800
Message-Id: <20200206020944.338033-3-jose.souza@intel.com>
In-Reply-To: <20200206020944.338033-1-jose.souza@intel.com>
References: <20200206020944.338033-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_frontbuffer_tracking: Enable
 positive test on linear tiling
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

aTkxNSBpcyBtYWtpbmcgZmVuY2VzIG5vdCBtYW5kYXRvcnkgdG8gZW5hYmxlIEZCQyBpbiBuZXdl
ciBwbGF0Zm9ybXMuCkFzIEJTcGVjIGRvIG5vdCBoYXZlIHJlc3RyaWN0aW9ucyBhZ2FpbnN0IHRp
bGluZyBmb3JtYXRzIHRvIGVuYWJsZQpGQkMgaXQgd2lsbCBiZSBwb3NzaWJsZSB0byBlbmFibGUg
RkJDIHdpdGggbGluZWFyIHRpbGluZywgc28gbGV0cyB0ZXN0Cml0LgoKQ2M6IFZpbGxlIFN5cmrD
pGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8Op
IFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19m
cm9udGJ1ZmZlcl90cmFja2luZy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRp
b25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgYi90
ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwppbmRleCBkNWE2NGE0ZC4uMmZkYTlhYjcg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCisrKyBiL3Rlc3Rz
L2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCkBAIC0yMTYxLDExICsyMTYxLDE1IEBAIHN0YXRp
YyB2b2lkIGZvcm1hdF9kcmF3X3N1YnRlc3QoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkKIAog
c3RhdGljIGJvb2wgdGlsaW5nX2lzX3ZhbGlkKGludCBmZWF0dXJlX2ZsYWdzLCBlbnVtIHRpbGVf
dHlwZSB0aWxlKQogeworCWludCBkZXZpZCA9IGludGVsX2dldF9kcm1fZGV2aWQoZHJtLmZkKTsK
KwogCWlmICghKGZlYXR1cmVfZmxhZ3MgJiBGRUFUVVJFX0ZCQykpCiAJCXJldHVybiB0cnVlOwog
CiAJc3dpdGNoICh0aWxlKSB7CiAJY2FzZSBUSUxFX0xJTkVBUjoKKwkJaWYgKEFUX0xFQVNUX0dF
TihkZXZpZCwgMTEpKQorCQkJcmV0dXJuIHRydWU7CiAJCXJldHVybiBmYWxzZTsKIAljYXNlIFRJ
TEVfWDoKIAljYXNlIFRJTEVfWToKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9pZ3QtZGV2Cg==
