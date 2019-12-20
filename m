Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 127086E0EB
 for <igt-dev@lists.freedesktop.org>; Fri, 20 Dec 2019 14:17:58 +0000 (UTC)
From: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>
Date: Fri, 20 Dec 2019 19:55:15 +0530
Message-Id: <20191220142515.13424-2-venkata.ramana.nayana@intel.com>
In-Reply-To: <20191220142515.13424-1-venkata.ramana.nayana@intel.com>
References: <20191220142515.13424-1-venkata.ramana.nayana@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/1] tests/i915/gem_fence: platforms not
 supporting fences
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
Cc: "Nayana, Venkata Ramana" <venkata.ramana.nayana@intel.com>, Kempczynski@freedesktop.org, Nayana@freedesktop.org, Dec@freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Rm9yIHBsYXRmb3JtcyBub3Qgc3VwcG9ydGluZyBmZW5jZXMobm8gYXBlcnR1cmUpLCBza2lwIHRl
c3RzCgpDYzogRGVjLCBLYXRhcnp5bmEgPGthdGFyenluYS5kZWNAaW50ZWwuY29tPgpDYzogS2Vt
cGN6eW5za2ksIFpiaWduaWV3IDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5jb20+ClNpZ25l
ZC1vZmYtYnk6IE5heWFuYSwgVmVua2F0YSBSYW1hbmEgPHZlbmthdGEucmFtYW5hLm5heWFuYUBp
bnRlbC5jb20+CkFja2VkLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBj
enluc2tpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9mZW5jZV90aHJhc2guYyAgICAg
ICB8IDIgKy0KIHRlc3RzL2k5MTUvZ2VtX2ZlbmNlZF9leGVjX3RocmFzaC5jIHwgMiArLQogMiBm
aWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvdGVzdHMvaTkxNS9nZW1fZmVuY2VfdGhyYXNoLmMgYi90ZXN0cy9pOTE1L2dlbV9mZW5jZV90
aHJhc2guYwppbmRleCBjODVjMzhiYi4uOWJlYWRhOTggMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUv
Z2VtX2ZlbmNlX3RocmFzaC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2ZlbmNlX3RocmFzaC5jCkBA
IC0yMDMsNyArMjAzLDcgQEAgc3RhdGljIGludCBydW5fdGVzdChpbnQgdGhyZWFkc19wZXJfZmVu
Y2UsIHZvaWQgKmYsIGludCB0aWxpbmcsCiAJdC5udW1fc3VyZmFjZXMgPSBzdXJmYWNlc19wZXJf
dGhyZWFkOwogCiAJbnVtX2ZlbmNlcyA9IGdlbV9hdmFpbGFibGVfZmVuY2VzKHQuZmQpOwotCWln
dF9hc3NlcnRfbHQoMCwgbnVtX2ZlbmNlcyk7CisJaWd0X3JlcXVpcmUobnVtX2ZlbmNlcyA+IDAp
OwogCiAJbnVtX3RocmVhZHMgPSB0aHJlYWRzX3Blcl9mZW5jZSAqIG51bV9mZW5jZXM7CiAKZGlm
ZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2ZlbmNlZF9leGVjX3RocmFzaC5jIGIvdGVzdHMvaTkx
NS9nZW1fZmVuY2VkX2V4ZWNfdGhyYXNoLmMKaW5kZXggZTQwZmE0MzguLmRiMWIxNWFhIDEwMDY0
NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9mZW5jZWRfZXhlY190aHJhc2guYworKysgYi90ZXN0cy9p
OTE1L2dlbV9mZW5jZWRfZXhlY190aHJhc2guYwpAQCAtMTY1LDcgKzE2NSw3IEBAIGlndF9tYWlu
CiAJCWlndF9yZXF1aXJlX2dlbShmZCk7CiAKIAkJbnVtX2ZlbmNlcyA9IGdlbV9hdmFpbGFibGVf
ZmVuY2VzKGZkKTsKLQkJaWd0X2Fzc2VydChudW1fZmVuY2VzID4gNCk7CisJCWlndF9yZXF1aXJl
KG51bV9mZW5jZXMgPiA0KTsKIAkJaWd0X2Fzc2VydChudW1fZmVuY2VzIDw9IE1BWF9GRU5DRVMp
OwogCiAJCWRldmlkID0gaW50ZWxfZ2V0X2RybV9kZXZpZChmZCk7Ci0tIAoyLjI0LjAKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGlu
ZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
