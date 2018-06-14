Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 438F56E73B
 for <igt-dev@lists.freedesktop.org>; Thu, 14 Jun 2018 10:32:57 +0000 (UTC)
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Date: Thu, 14 Jun 2018 11:32:46 +0100
Message-Id: <20180614103252.17866-2-lionel.g.landwerlin@intel.com>
In-Reply-To: <20180614103252.17866-1-lionel.g.landwerlin@intel.com>
References: <20180614103252.17866-1-lionel.g.landwerlin@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/7] lib: intel: add a new macro for number
 of register to MI_LRI
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

VG8gYmUgcmV1c2UgaW4gdGhlIGZvbGxvd2luZyBjb21taXRzLgoKU2lnbmVkLW9mZi1ieTogTGlv
bmVsIExhbmR3ZXJsaW4gPGxpb25lbC5nLmxhbmR3ZXJsaW5AaW50ZWwuY29tPgotLS0KIGxpYi9p
bnRlbF9yZWcuaCB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX3JlZy5oIGIvbGliL2ludGVsX3JlZy5o
CmluZGV4IGY4NWZiNzQyLi5jMjMzMDQxMSAxMDA2NDQKLS0tIGEvbGliL2ludGVsX3JlZy5oCisr
KyBiL2xpYi9pbnRlbF9yZWcuaApAQCAtMjU2OSw3ICsyNTY5LDggQEAgU09GVFdBUkUgT1IgVEhF
IFVTRSBPUiBPVEhFUiBERUFMSU5HUyBJTiBUSEUgU09GVFdBUkUuCiAjZGVmaW5lIE1JX1dBSVRf
Rk9SX1BJUEVBX1NDQU5fTElORV9XSU5ET1cJKDE8PDEpCiAKICNkZWZpbmUgTUlfTE9BRF9TQ0FO
X0xJTkVTX0lOQ0wJCSgweDEyPDwyMykKLSNkZWZpbmUgTUlfTE9BRF9SRUdJU1RFUl9JTU0JCSgo
MHgyMiA8PCAyMykgfCAxKQorI2RlZmluZSBNSV9MT0FEX1JFR0lTVEVSX0lNTV9uKG4pCSgoMHgy
MiA8PCAyMykgfCAoMiAqIChuKSAtIDEpKQorI2RlZmluZSBNSV9MT0FEX1JFR0lTVEVSX0lNTQkJ
TUlfTE9BRF9SRUdJU1RFUl9JTU1fbigxKQogCiAvKiBGbHVzaCAqLwogI2RlZmluZSBNSV9GTFVT
SAkJCSgweDA0PDwyMykKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
