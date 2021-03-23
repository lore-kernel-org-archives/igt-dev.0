Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F8D6E861
 for <igt-dev@lists.freedesktop.org>; Tue, 23 Mar 2021 18:13:12 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Tue, 23 Mar 2021 19:13:01 +0100
Message-Id: <20210323181301.49073-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_mmap_offset: Fix invalid munmap
 in api_intel_bb
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Rml4IGJ1ZyB3aGljaCBsZWFkcyB0byBTSUdTRUdWIGluIGFwaV9pbnRlbF9iYkByZW5kZXItY2Nz
IHRlc3QuCkluc3RlYWQgb2YgcG9pbnRlciB1bm1hcCB3YXMgZG9uZSBvbiBpbnRlbF9idWYgd2hh
dCB3YXMgd3JvbmcuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWdu
aWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZh
bGFAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+
Ci0tLQogdGVzdHMvaTkxNS9hcGlfaW50ZWxfYmIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvYXBp
X2ludGVsX2JiLmMgYi90ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCmluZGV4IGNjMWQxYmU2ZS4u
OTExNWQzZjhmIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2FwaV9pbnRlbF9iYi5jCisrKyBiL3Rl
c3RzL2k5MTUvYXBpX2ludGVsX2JiLmMKQEAgLTEwNjgsNyArMTA2OCw3IEBAIHN0YXRpYyB1aW50
MzJfdCBjb3VudF9jb21wcmVzc2VkKGludCBnZW4sIHN0cnVjdCBpbnRlbF9idWYgKmJ1ZikKIAkJ
aWYgKHB0cltidWYtPmNjc1swXS5vZmZzZXQgKyBpXSkKIAkJCWNvbXByZXNzZWQrKzsKIAotCW11
bm1hcChidWYsIGludGVsX2J1Zl9ib19zaXplKGJ1ZikpOworCW11bm1hcChwdHIsIGludGVsX2J1
Zl9ib19zaXplKGJ1ZikpOwogCiAJcmV0dXJuIGNvbXByZXNzZWQ7CiB9Ci0tIAoyLjI2LjAKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
