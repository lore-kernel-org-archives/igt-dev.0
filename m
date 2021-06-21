Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D964989D57
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Jun 2021 03:00:23 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 21 Jun 2021 05:00:10 +0200
Message-Id: <20210621030010.9956-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_dummyload: Fix undefined behavior
 in bitshift
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

QXMgYSBwYXJ0IG9mIHJld3JpdGluZyB0ZXN0cyB0byB1c2Ugbm8tcmVsb2MgSSB3YXMgYSBsaXR0
bGUgYml0CnN1cnByaXNlZCBhZGRyIGNhbGN1bGF0aW9uIG9uIG15IFNLTCBib3ggbGVhZCB0byBz
b21lIHN0cmFuZ2UKb2Zmc2V0cyB3aGljaCBmaW5hbGx5IHVzZSByZWxvY2F0aW9ucyBpbnN0ZWFk
LiBBdCBmaXJzdCBnbGFuY2UKSSB3YXNuJ3QgYWJsZSB0byBzcG90IGl0LCBkZWJ1Z2dpbmcgcmV2
ZWFsczoKCglpZiAoYWRkciA+PiAzMSkKCQlhZGRyID0gMSA8PCAzMTsKCmdpdmVzIGFkZHIgPT0g
ZmZmZmZmZmY4MDAwMDAwMAoKd2hhdCBpcyBub3QgYWRkcmVzcyB3ZSB3YW50IHRvIHVzZSBhcyBh
biBhcmd1bWVudCB0byBtb2R1bG8uCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRz
a2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KQ2M6IFBldHJpIExhdHZhbGEgPHBl
dHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzogTWlrYSBLdW9wcGFsYSA8bWlrYS5rdW9wcGFsYUBs
aW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9kdW1teWxvYWQuYyB8IDIgKy0KIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9p
Z3RfZHVtbXlsb2FkLmMgYi9saWIvaWd0X2R1bW15bG9hZC5jCmluZGV4IDgyNDU5ZTUyNC4uZmM1
NWJlMTViIDEwMDY0NAotLS0gYS9saWIvaWd0X2R1bW15bG9hZC5jCisrKyBiL2xpYi9pZ3RfZHVt
bXlsb2FkLmMKQEAgLTExOSw3ICsxMTksNyBAQCBlbWl0X3JlY3Vyc2l2ZV9iYXRjaChpZ3Rfc3Bp
bl90ICpzcGluLAogCSAqLwogCWFkZHIgPSBnZW1fYXBlcnR1cmVfc2l6ZShmZCkgLyAyOwogCWlm
IChhZGRyID4+IDMxKQotCQlhZGRyID0gMSA8PCAzMTsKKwkJYWRkciA9IDFVTEwgPDwgMzE7CiAJ
YWRkciArPSByYW5kb20oKSAlIGFkZHIgLyAyOwogCWFkZHIgJj0gLTQwOTY7CiAKLS0gCjIuMjYu
MAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRl
diBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
