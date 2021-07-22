Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF586EB10
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 08:33:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Thu, 22 Jul 2021 10:32:16 +0200
Message-Id: <20210722083240.33453-27-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
References: <20210722083240.33453-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 26/50] tests/gem_mmap_offset: Add allocator
 support
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
Cc: Sai Gowtham <sai.gowtham.ch@intel.com>, Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogU2FpIEdvd3RoYW0gPHNhaS5nb3d0aGFtLmNoQGludGVsLmNvbT4KClNpZ25lZC1vZmYt
Ynk6IFNhaSBHb3d0aGFtIDxzYWkuZ293dGhhbS5jaEBpbnRlbC5jb20+CkNjOiBaYmlnbmlldyBL
ZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IFBldHJpIExh
dHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogQXNodXRvc2ggRGl4aXQgPGFzaHV0
b3NoLmRpeGl0QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9tbWFwX29mZnNldC5jIHwg
NCArKystCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZzZXQuYyBiL3Rlc3RzL2k5MTUvZ2Vt
X21tYXBfb2Zmc2V0LmMKaW5kZXggZjFiYTY3YjdjLi44MTQ4ZjBhMmQgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2k5MTUvZ2VtX21tYXBfb2Zmc2V0LmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fbW1hcF9vZmZz
ZXQuYwpAQCAtMjQ4LDcgKzI0OCw4IEBAIHN0YXRpYyB2b2lkIGlzb2xhdGlvbihpbnQgaTkxNSkK
IAogc3RhdGljIHZvaWQgcGZfbm9uYmxvY2soaW50IGk5MTUpCiB7Ci0JaWd0X3NwaW5fdCAqc3Bp
biA9IGlndF9zcGluX25ldyhpOTE1KTsKKwl1aW50NjRfdCBhaG5kID0gZ2V0X3JlbG9jX2FobmQo
aTkxNSwgMCk7CisJaWd0X3NwaW5fdCAqc3BpbiA9IGlndF9zcGluX25ldyhpOTE1LCAuYWhuZCA9
IGFobmQpOwogCiAJZm9yX2VhY2hfbW1hcF9vZmZzZXRfdHlwZShpOTE1LCB0KSB7CiAJCXVpbnQz
Ml90ICpwdHI7CkBAIC0yNjgsNiArMjY5LDcgQEAgc3RhdGljIHZvaWQgcGZfbm9uYmxvY2soaW50
IGk5MTUpCiAJfQogCiAJaWd0X3NwaW5fZnJlZShpOTE1LCBzcGluKTsKKwlwdXRfYWhuZChhaG5k
KTsKIH0KIAogc3RhdGljIHZvaWQgKm1lbWNocl9pbnYoY29uc3Qgdm9pZCAqcywgaW50IGMsIHNp
emVfdCBuKQotLSAKMi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
