Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C67289150
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 22:52:07 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Mon,  8 Apr 2019 15:52:00 -0700
Message-Id: <20190408225200.33606-2-antonio.argenziano@intel.com>
In-Reply-To: <20190408225200.33606-1-antonio.argenziano@intel.com>
References: <20190408225200.33606-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_fd_exhaustion.c: Expect
 ENFILE when fds run out
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Q2hhbmdlIHRoZSB0ZXN0IHRvIGV4cGVjdCBnZW1fY3JlYXRlIHRvIHJldHVybiBFTkZJTEUgd2hl
biB3ZSBydW4gb3V0IG9mCmZkcy4KCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpTaWdu
ZWQtb2ZmLWJ5OiBBbnRvbmlvIEFyZ2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5j
b20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fZmRfZXhoYXVzdGlvbi5jIHwgMTEgKysrKysrLS0tLS0K
IDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvdGVzdHMvaTkxNS9nZW1fZmRfZXhoYXVzdGlvbi5jIGIvdGVzdHMvaTkxNS9nZW1fZmRf
ZXhoYXVzdGlvbi5jCmluZGV4IDIzNjAyYjk4Li44M2QwZTkyNiAxMDA2NDQKLS0tIGEvdGVzdHMv
aTkxNS9nZW1fZmRfZXhoYXVzdGlvbi5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2ZkX2V4aGF1c3Rp
b24uYwpAQCAtNDgsMTUgKzQ4LDE2IEBAIGlndF9zaW1wbGVfbWFpbgogCQkJaW50IGxlYWsgPSBv
cGVuKCIvZGV2L251bGwiLCBPX1JET05MWSk7CiAJCQl1aW50MzJfdCBoYW5kbGU7CiAKLQkJCWlm
IChfX2dlbV9jcmVhdGUoZmQsIDQwOTYsICZoYW5kbGUpID09IDApCi0JCQkJZ2VtX2Nsb3NlKGZk
LCBoYW5kbGUpOwotCiAJCQlpZiAobGVhayA8IDApIHsKIAkJCQlpZ3RfaW5mbygiZmQgZXhoYXVz
dGlvbiBhZnRlciAlaSByb3VuZHMuXG4iLCBpKTsKLQkJCQlpZ3RfYXNzZXJ0KF9fZ2VtX2NyZWF0
ZShmZCwgNDA5NiwKLQkJCQkJCQkmaGFuZGxlKSA8IDApOworCQkJCWlndF9hc3NlcnRfZXEoX19n
ZW1fY3JlYXRlKGZkLCA0MDk2LAorCQkJCQkJCSZoYW5kbGUpLCAtRU5GSUxFKTsKIAkJCQlicmVh
azsKIAkJCX0KKworCQkJaWYgKF9fZ2VtX2NyZWF0ZShmZCwgNDA5NiwgJmhhbmRsZSkgPT0gMCkK
KwkJCQlnZW1fY2xvc2UoZmQsIGhhbmRsZSk7CisKIAkJfQogCiAJCS8qIFRoZSBjaGlsZCB3aWxs
IGZyZWUgYWxsIHRoZSBmZHMgd2hlbiBleGl0aW5nLCBzbyBubyBuZWVkIHRvCi0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
