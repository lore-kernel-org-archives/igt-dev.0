Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2D96E2F9
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Sep 2018 16:38:50 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon, 24 Sep 2018 09:38:49 -0700
Message-Id: <20180924163849.16259-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tests/gem_ctx_isoation: Add warn for newer
 gens.
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

QWRkIGEgd2FybmluZyB0byB1cGRhdGUgdGVzdCBpZiBHRU4gdmVyc2lvbiBpcyBub3QgcmVjb2du
aXplZC4KClNpZ25lZC1vZmYtYnk6IEFudG9uaW8gQXJnZW56aWFubyA8YW50b25pby5hcmdlbnpp
YW5vQGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVr
PgotLS0KIHRlc3RzL2dlbV9jdHhfaXNvbGF0aW9uLmMgfCA0ICsrKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9nZW1f
Y3R4X2lzb2xhdGlvbi5jIGIvdGVzdHMvZ2VtX2N0eF9pc29sYXRpb24uYwppbmRleCA0MzI1ZTFj
Mi4uYmQwN2IxNDEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2dlbV9jdHhfaXNvbGF0aW9uLmMKKysrIGIv
dGVzdHMvZ2VtX2N0eF9pc29sYXRpb24uYwpAQCAtNzAwLDcgKzcwMCw5IEBAIGlndF9tYWluCiAJ
CWlndF9yZXF1aXJlKGhhc19jb250ZXh0X2lzb2xhdGlvbik7CiAKIAkJZ2VuID0gaW50ZWxfZ2Vu
KGludGVsX2dldF9kcm1fZGV2aWQoZmQpKTsKLQkJLy9pZ3RfY2lfZmFpbF9vbihnZW4gPiBMQVNU
X0tOT1dOX0dFTik7CisKKwkJaWd0X3dhcm5fb25fZihnZW4gPiBMQVNUX0tOT1dOX0dFTiwKKwkJ
CQkiR0VOIG5vdCByZWNvZ25pemVkISBUZXN0IG5lZWRzIHRvIGJlIHVwZGF0ZWQgdG8gcnVuLiIp
OwogCQlpZ3Rfc2tpcF9vbihnZW4gPiBMQVNUX0tOT1dOX0dFTik7CiAJfQogCi0tIAoyLjE2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
