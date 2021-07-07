Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2446F6E17E
 for <igt-dev@lists.freedesktop.org>; Wed,  7 Jul 2021 14:45:22 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so3868985pjs.2
 for <igt-dev@lists.freedesktop.org>; Wed, 07 Jul 2021 07:45:22 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed,  7 Jul 2021 09:43:35 -0500
Message-Id: <20210707144337.180693-48-jason@jlekstrand.net>
In-Reply-To: <20210707144337.180693-1-jason@jlekstrand.net>
References: <20210707144337.180693-1-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 47/81] tests/core_hotplug: Convert to
 intel_ctx_t
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

U2lnbmVkLW9mZi1ieTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgpSZXZp
ZXdlZC1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRl
bC5jb20+Ci0tLQogdGVzdHMvY29yZV9ob3R1bnBsdWcuYyB8IDYgKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
Y29yZV9ob3R1bnBsdWcuYyBiL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKaW5kZXggODc4ZWZjYzdi
Li4yZDczZTI3ZjIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2NvcmVfaG90dW5wbHVnLmMKKysrIGIvdGVz
dHMvY29yZV9ob3R1bnBsdWcuYwpAQCAtMjkyLDYgKzI5Miw3IEBAIHN0YXRpYyBpbnQgbG9jYWxf
aTkxNV9oZWFsdGhjaGVjayhpbnQgaTkxNSwgY29uc3QgY2hhciAqcHJlZml4KQogCQkuYnVmZmVy
X2NvdW50ID0gMSwKIAl9OwogCWNvbnN0IHN0cnVjdCBpbnRlbF9leGVjdXRpb25fZW5naW5lMiAq
ZW5naW5lOworCWNvbnN0IGludGVsX2N0eF90ICpjdHg7CiAJaW50IGZlbmNlID0gLTEsIGVyciA9
IDAsIHN0YXR1cyA9IDE7CiAKIAlsb2NhbF9kZWJ1ZygiJXMlc1xuIiwgcHJlZml4LCAicnVubmlu
ZyBpOTE1IEdQVSBoZWFsdGhjaGVjayIpOwpAQCAtMzAzLDcgKzMwNCw5IEBAIHN0YXRpYyBpbnQg
bG9jYWxfaTkxNV9oZWFsdGhjaGVjayhpbnQgaTkxNSwgY29uc3QgY2hhciAqcHJlZml4KQogCWdl
bV93cml0ZShpOTE1LCBvYmouaGFuZGxlLCAwLCAmYmJlLCBzaXplb2YoYmJlKSk7CiAKIAkvKiBB
cyBzb29uIGFzIGEgZmVuY2UgaXMgb3BlbiwgZG9uJ3QgZmFpbCBiZWZvcmUgY2xvc2luZyBpdCAq
LwotCV9fZm9yX2VhY2hfcGh5c2ljYWxfZW5naW5lKGk5MTUsIGVuZ2luZSkgeworCWN0eCA9IGlu
dGVsX2N0eF9jcmVhdGVfYWxsX3BoeXNpY2FsKGk5MTUpOworCWZvcl9lYWNoX2N0eF9lbmdpbmUo
aTkxNSwgY3R4LCBlbmdpbmUpIHsKKwkJZXhlY2J1Zi5yc3ZkMSA9IGN0eC0+aWQ7CiAJCWV4ZWNi
dWYuZmxhZ3MgPSBlbmdpbmUtPmZsYWdzIHwgSTkxNV9FWEVDX0ZFTkNFX09VVDsKIAkJZXJyID0g
X19nZW1fZXhlY2J1Zl93cihpOTE1LCAmZXhlY2J1Zik7CiAJCWlmIChpZ3Rfd2Fybl9vbl9mKGVy
ciA8IDAsICJfX2dlbV9leGVjYnVmX3dyKCkgcmV0dXJuZWQgJWRcbiIsCkBAIC0zMTcsNiArMzIw
LDcgQEAgc3RhdGljIGludCBsb2NhbF9pOTE1X2hlYWx0aGNoZWNrKGludCBpOTE1LCBjb25zdCBj
aGFyICpwcmVmaXgpCiAJCQlicmVhazsKIAkJfQogCX0KKwlpbnRlbF9jdHhfZGVzdHJveShpOTE1
LCBjdHgpOwogCWlmIChmZW5jZSA+PSAwKSB7CiAJCXN0YXR1cyA9IHN5bmNfZmVuY2Vfd2FpdChm
ZW5jZSwgLTEpOwogCQlpZiAoaWd0X3dhcm5fb25fZihzdGF0dXMgPCAwLCAic3luY19mZW5jZV93
YWl0KCkgcmV0dXJuZWQgJWRcbiIsCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldgo=
