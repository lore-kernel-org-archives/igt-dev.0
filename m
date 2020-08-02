Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4FC89E03
 for <igt-dev@lists.freedesktop.org>; Sun,  2 Aug 2020 15:24:09 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Sun,  2 Aug 2020 17:23:08 +0200
Message-Id: <20200802152309.4826-19-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
References: <20200802152309.4826-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v22 18/19] tests/kms_psr: trying to fix blt
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

VW5mb3J0dW5hdGVseSBJJ20gbm90IGFibGUgdG8gcmVwcm9kdWNlLCBzbyBibGluZCBzaG90IGFu
ZCB0byBiZQpzcXVhc2hlZCBpZiBoaXQuCgpTaWduZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5
xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcHNy
LmMgfCA1ICsrKystCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bzci5jIGIvdGVzdHMva21zX3Bzci5jCmluZGV4
IGQyYzVjNTQwLi40NzExNGI1ZSAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3Bzci5jCisrKyBiL3Rl
c3RzL2ttc19wc3IuYwpAQCAtMTYyLDE5ICsxNjIsMjIgQEAgc3RhdGljIHZvaWQgZmlsbF9ibHQo
ZGF0YV90ICpkYXRhLCBjb25zdCBzdHJ1Y3QgaWd0X2ZiICpmYiwgdW5zaWduZWQgY2hhciBjb2xv
cikKIAogCWliYiA9IGludGVsX2JiX2NyZWF0ZShkYXRhLT5kcm1fZmQsIDQwOTYpOwogCWRzdCA9
IGNyZWF0ZV9idWZfZnJvbV9mYihkYXRhLCBmYik7CisJaW50ZWxfYmJfYWRkX2ludGVsX2J1Zihp
YmIsIGRzdCwgdHJ1ZSk7CiAKIAljb2xvcl9ibGl0X3N0YXJ0KGliYik7CiAJaW50ZWxfYmJfb3V0
KGliYiwgKDEgPDwgMjQpIHwgKDB4ZjAgPDwgMTYpIHwgMCk7CiAJaW50ZWxfYmJfb3V0KGliYiwg
MCk7CiAJaW50ZWxfYmJfb3V0KGliYiwgMHhmZmYgPDwgMTYgfCAweGZmZik7CiAJaW50ZWxfYmJf
ZW1pdF9yZWxvYyhpYmIsIGRzdC0+aGFuZGxlLCBJOTE1X0dFTV9ET01BSU5fUkVOREVSLAotCQkJ
ICAgIEk5MTVfR0VNX0RPTUFJTl9SRU5ERVIsIDAsIDB4MCk7CisJCQkgICAgSTkxNV9HRU1fRE9N
QUlOX1JFTkRFUiwgMCwgZHN0LT5hZGRyLm9mZnNldCk7CiAJaW50ZWxfYmJfb3V0KGliYiwgY29s
b3IpOwogCiAJaW50ZWxfYmJfZmx1c2hfYmxpdChpYmIpOwogCWludGVsX2JiX3N5bmMoaWJiKTsK
IAlpbnRlbF9iYl9kZXN0cm95KGliYik7CiAJaW50ZWxfYnVmX2Rlc3Ryb3koZHN0KTsKKworCWdl
bV9ib19idXN5KGRhdGEtPmRybV9mZCwgZmItPmdlbV9oYW5kbGUpOwogfQogCiBzdGF0aWMgdm9p
ZCBmaWxsX3JlbmRlcihkYXRhX3QgKmRhdGEsIGNvbnN0IHN0cnVjdCBpZ3RfZmIgKmZiLAotLSAK
Mi4yNi4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
