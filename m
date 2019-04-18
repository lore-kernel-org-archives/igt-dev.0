Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A18B6E11F
 for <igt-dev@lists.freedesktop.org>; Thu, 18 Apr 2019 12:11:38 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 18 Apr 2019 15:11:35 +0300
Message-Id: <20190418121135.20680-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20190417203544.22298-2-ville.syrjala@linux.intel.com>
References: <20190417203544.22298-2-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 2/5] tests/i915/gem_render_copy: Don't
 leak bos between subtests
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClVu
cmVmIHRoZSBib3MgYWZ0ZXIgb25lIHN1YnRlc3QgaXMgZG9uZS4gVGhlIG5leHQgc3VidGVzdAp3
aWxsIGFsbG9jYXRlIGl0cyBvd24gYm9zLgoKdjI6IEFkZCBzY3JhdGNoX2J1Zl9maW5pKCkgYW5k
IHJldmVyc2UgdGhlIG9uaW9uIChDaHJpcykKClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9yZW5kZXJf
Y29weS5jIHwgMTIgKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl9jb3B5LmMgYi90ZXN0cy9pOTE1
L2dlbV9yZW5kZXJfY29weS5jCmluZGV4IDhkNjJhMGY0M2FkOC4uYjVkMWY0NWYwNDIyIDEwMDY0
NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9yZW5kZXJfY29weS5jCisrKyBiL3Rlc3RzL2k5MTUvZ2Vt
X3JlbmRlcl9jb3B5LmMKQEAgLTQ1OSw2ICs0NTksMTEgQEAgc3RhdGljIHZvaWQgc2NyYXRjaF9i
dWZfaW5pdChkYXRhX3QgKmRhdGEsIHN0cnVjdCBpZ3RfYnVmICpidWYsCiAJaWd0X2Fzc2VydChp
Z3RfYnVmX2hlaWdodChidWYpID09IGhlaWdodCk7CiB9CiAKK3N0YXRpYyB2b2lkIHNjcmF0Y2hf
YnVmX2Zpbmkoc3RydWN0IGlndF9idWYgKmJ1ZikKK3sKKwlkcm1faW50ZWxfYm9fdW5yZWZlcmVu
Y2UoYnVmLT5ibyk7Cit9CisKIHN0YXRpYyB2b2lkCiBzY3JhdGNoX2J1Zl9jaGVjayhkYXRhX3Qg
KmRhdGEsCiAJCSAgc3RydWN0IGlndF9idWYgKmJ1ZiwKQEAgLTY2Miw2ICs2NjcsMTMgQEAgc3Rh
dGljIHZvaWQgdGVzdChkYXRhX3QgKmRhdGEsIHVpbnQzMl90IHRpbGluZywgdWludDY0X3QgY2Nz
X21vZGlmaWVyKQogCiAJaWYgKGNjc19tb2RpZmllcikKIAkJc2NyYXRjaF9idWZfYXV4X2NoZWNr
KGRhdGEsICZjY3MpOworCisJc2NyYXRjaF9idWZfZmluaSgmcmVmKTsKKwlpZiAoY2NzX21vZGlm
aWVyKQorCQlzY3JhdGNoX2J1Zl9maW5pKCZjY3MpOworCXNjcmF0Y2hfYnVmX2ZpbmkoJmRzdCk7
CisJZm9yIChpbnQgaSA9IDA7IGkgPCBudW1fc3JjOyBpKyspCisJCXNjcmF0Y2hfYnVmX2Zpbmko
JnNyY1tpXS5idWYpOwogfQogCiBzdGF0aWMgaW50IG9wdF9oYW5kbGVyKGludCBvcHQsIGludCBv
cHRfaW5kZXgsIHZvaWQgKmRhdGEpCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vaWd0LWRldg==
