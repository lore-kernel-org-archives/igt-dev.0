Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1131C6E73D
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2019 12:36:20 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 25 Jul 2019 15:35:44 +0300
Message-Id: <20190725123546.16038-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190725123546.16038-1-arkadiusz.hiler@intel.com>
References: <20190725123546.16038-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] tests/kms_hdmi_inject: Unset all crtcs
 before the test
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk9u
IHByZS1IU1cgd2UgaGF2ZSBzZXBhcmF0ZSBlbmNvZGVycyBmb3IgdGhlIERQIGFuZCBIRE1JIHBv
cnRzLApidXQgYm90aCBjYW4ndCBiZSBlbmFibGVkIGF0IHRoZSBzYW1lIHRpbWUuIFRoZSB0ZXN0
IGZhaWxzIHRvCmFjY291bnQgZm9yIHRoYXQgYW5kIGNhbiB0aHVzIGZhaWwgd2hlbiB0aGUga2Vy
bmVsIHJlamVjdHMKdGhlIG1vZGVzZXQuIFdlIGNhbiBhdm9pZCB0aGF0IGJ5IHR1cm5pbmcgb2Zm
IGFsbCB0aGUgcG9ydHMKYmVmb3JlaGFuZC4KClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzD
pCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+ClJldmlld2VkLWJ5OiBBcmthZGl1c3og
SGlsZXIgPGFya2FkaXVzei5oaWxlckBpbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2hkbWlfaW5q
ZWN0LmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0
IGEvdGVzdHMva21zX2hkbWlfaW5qZWN0LmMgYi90ZXN0cy9rbXNfaGRtaV9pbmplY3QuYwppbmRl
eCA3ODY4NDI0MS4uM2RhMTAyOGMgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19oZG1pX2luamVjdC5j
CisrKyBiL3Rlc3RzL2ttc19oZG1pX2luamVjdC5jCkBAIC0yMDMsNiArMjAzLDggQEAgaWd0X21h
aW4KIAogCQljb25uZWN0b3IgPSBnZXRfY29ubmVjdG9yKGRybV9mZCwgcmVzKTsKIAkJaWd0X3Jl
cXVpcmUoY29ubmVjdG9yKTsKKworCQlrbXN0ZXN0X3Vuc2V0X2FsbF9jcnRjcyhkcm1fZmQsIHJl
cyk7CiAJfQogCiAJaWd0X2Rlc2NyaWJlKCJNYWtlIHN1cmUgdGhhdCA0SyBtb2RlcyBleHBvc2Vk
IGJ5IERSTSBtYXRjaCB0aGUgIgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXY=
