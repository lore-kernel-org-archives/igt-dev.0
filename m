Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1077189C1E
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 17:08:45 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so4384092pjz.3
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jun 2021 10:08:45 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 16 Jun 2021 12:08:39 -0500
Message-Id: <20210616170839.484410-1-jason@jlekstrand.net>
In-Reply-To: <20210614163902.366168-5-jason@jlekstrand.net>
References: <20210614163902.366168-5-jason@jlekstrand.net>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/i915: Use intel_ctx_0() for submission
 tests (v2)
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

VGhpcyBkb2VzIG1ha2UgdGhlIGFzc3VtcHRpb24gdGhhdCBjdHgwIGhhcyB0aGUgZGVmYXVsdCBz
ZXQgb2YgZW5naW5lcwpidXQsIG5vdyB0aGF0IHdlJ3ZlIGNvbnZlcnRlZCBldmVyeXRoaW5nIHRv
IGludGVsX2N0eF90LCB0aGlzIGFzc3VtcHRpb24Kc2hvdWxkIGJlIG9rLgoKdjIgKFpiaWduaWV3
IEtlbXBjennFhHNraSk6CiAtIFVzZSBmb3JfZWFjaF9jdHhfZW5naW5lIHdpdGggaW50ZWxfY3R4
XzAoKSBpbnN0ZWFkIG9mCiAgIGZvcl9lYWNoX3BoeXNpY2FsX3JpbmcoKQoKU2lnbmVkLW9mZi1i
eTogSmFzb24gRWtzdHJhbmQgPGphc29uQGpsZWtzdHJhbmQubmV0PgotLS0KIGxpYi9pOTE1L2dl
bV9zdWJtaXNzaW9uLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2k5MTUvZ2VtX3N1Ym1pc3Npb24uYyBi
L2xpYi9pOTE1L2dlbV9zdWJtaXNzaW9uLmMKaW5kZXggYmQ0YmJiM2VmLi4xYWYwMDlmYjEgMTAw
NjQ0Ci0tLSBhL2xpYi9pOTE1L2dlbV9zdWJtaXNzaW9uLmMKKysrIGIvbGliL2k5MTUvZ2VtX3N1
Ym1pc3Npb24uYwpAQCAtMjAyLDcgKzIwMiw3IEBAIHZvaWQgZ2VtX3Rlc3RfZW5naW5lKGludCBp
OTE1LCB1bnNpZ25lZCBpbnQgZW5naW5lKQogCWlmIChlbmdpbmUgPT0gQUxMX0VOR0lORVMpIHsK
IAkJY29uc3Qgc3RydWN0IGludGVsX2V4ZWN1dGlvbl9lbmdpbmUyICplMjsKIAotCQlfX2Zvcl9l
YWNoX3BoeXNpY2FsX2VuZ2luZShpOTE1LCBlMikgeworCQlmb3JfZWFjaF9jdHhfZW5naW5lKGk5
MTUsIGludGVsX2N0eF8wKGk5MTUpLCBlMikgewogCQkJZXhlY2J1Zi5mbGFncyA9IGUyLT5mbGFn
czsKIAkJCWdlbV9leGVjYnVmKGk5MTUsICZleGVjYnVmKTsKIAkJfQpAQCAtMzg1LDcgKzM4NSw3
IEBAIHVuc2lnbmVkIGludCBnZW1fc3VibWlzc2lvbl9tZWFzdXJlKGludCBpOTE1LCB1bnNpZ25l
ZCBpbnQgZW5naW5lKQogCQlzdHJ1Y3QgaW50ZWxfZXhlY3V0aW9uX2VuZ2luZTIgKmU7CiAKIAkJ
c2l6ZSA9IC0xOwotCQlfX2Zvcl9lYWNoX3BoeXNpY2FsX2VuZ2luZShpOTE1LCBlKSB7CisJCWZv
cl9lYWNoX2N0eF9lbmdpbmUoaTkxNSwgaW50ZWxfY3R4XzAoaTkxNSksIGUpIHsKIAkJCXVuc2ln
bmVkIGludCB0aGlzID0gIF9fbWVhc3VyZV9yaW5nc2l6ZShpOTE1LCBlLT5mbGFncyk7CiAJCQlp
ZiAodGhpcyA8IHNpemUpCiAJCQkJc2l6ZSA9IHRoaXM7Ci0tIAoyLjMxLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
