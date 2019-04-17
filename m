Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D49CA6E08F
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Apr 2019 20:35:50 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Wed, 17 Apr 2019 23:35:41 +0300
Message-Id: <20190417203544.22298-2-ville.syrjala@linux.intel.com>
In-Reply-To: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
References: <20190417203544.22298-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/5] tests/i915/gem_render_copy: Don't leak
 bos between subtests
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
aWxsIGFsbG9jYXRlIGl0cyBvd24gYm9zLgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9yZW5k
ZXJfY29weS5jIHwgNyArKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fcmVuZGVyX2NvcHkuYyBiL3Rlc3RzL2k5MTUvZ2Vt
X3JlbmRlcl9jb3B5LmMKaW5kZXggOGQ2MmEwZjQzYWQ4Li5hNjQ3NmE0ZDJkOGQgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl9jb3B5LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fcmVu
ZGVyX2NvcHkuYwpAQCAtNjYyLDYgKzY2MiwxMyBAQCBzdGF0aWMgdm9pZCB0ZXN0KGRhdGFfdCAq
ZGF0YSwgdWludDMyX3QgdGlsaW5nLCB1aW50NjRfdCBjY3NfbW9kaWZpZXIpCiAKIAlpZiAoY2Nz
X21vZGlmaWVyKQogCQlzY3JhdGNoX2J1Zl9hdXhfY2hlY2soZGF0YSwgJmNjcyk7CisKKwlmb3Ig
KGludCBpID0gMDsgaSA8IG51bV9zcmM7IGkrKykKKwkJZHJtX2ludGVsX2JvX3VucmVmZXJlbmNl
KHNyY1tpXS5idWYuYm8pOworCWRybV9pbnRlbF9ib191bnJlZmVyZW5jZShkc3QuYm8pOworCWlm
IChjY3NfbW9kaWZpZXIpCisJCWRybV9pbnRlbF9ib191bnJlZmVyZW5jZShjY3MuYm8pOworCWRy
bV9pbnRlbF9ib191bnJlZmVyZW5jZShyZWYuYm8pOwogfQogCiBzdGF0aWMgaW50IG9wdF9oYW5k
bGVyKGludCBvcHQsIGludCBvcHRfaW5kZXgsIHZvaWQgKmRhdGEpCi0tIAoyLjIxLjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
