Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C3986E741
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2019 12:36:24 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 25 Jul 2019 15:35:46 +0300
Message-Id: <20190725123546.16038-4-arkadiusz.hiler@intel.com>
In-Reply-To: <20190725123546.16038-1-arkadiusz.hiler@intel.com>
References: <20190725123546.16038-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 4/4] tests/kms_hdmi_inject: Accept any HDMI
 connector
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkNv
bm5lY3RvciBmb3JjaW5nIHdvcmtzIGp1c3QgZmluZSBldmVuIGlmIGl0IGFscmVhZHkgaGFzCnNv
bWV0aGluZyBwaHlzaWNhbGx5IGNvbm5lY3RlZC4gU28gYWNjZXB0IGFueSBIRE1JIGNvbm5lY3Rv
cgpmb3IgdGhlIHRlc3QuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5
cmphbGFAbGludXguaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmth
ZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19oZG1pX2luamVjdC5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90ZXN0cy9rbXNfaGRtaV9pbmplY3QuYyBiL3Rlc3RzL2ttc19oZG1pX2luamVjdC5j
CmluZGV4IDNkYTEwMjhjLi4yYTUyMDg3ZCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX2hkbWlfaW5q
ZWN0LmMKKysrIGIvdGVzdHMva21zX2hkbWlfaW5qZWN0LmMKQEAgLTY1LDggKzY1LDcgQEAgZ2V0
X2Nvbm5lY3RvcihpbnQgZHJtX2ZkLCBkcm1Nb2RlUmVzICpyZXMpCiAJCWNvbm5lY3RvciA9CiAJ
CQlkcm1Nb2RlR2V0Q29ubmVjdG9yQ3VycmVudChkcm1fZmQsIHJlcy0+Y29ubmVjdG9yc1tpXSk7
CiAKLQkJaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9S
X0hETUlBICYmCi0JCSAgICBjb25uZWN0b3ItPmNvbm5lY3Rpb24gPT0gRFJNX01PREVfRElTQ09O
TkVDVEVEKQorCQlpZiAoY29ubmVjdG9yLT5jb25uZWN0b3JfdHlwZSA9PSBEUk1fTU9ERV9DT05O
RUNUT1JfSERNSUEpCiAJCQlicmVhazsKIAogCQlkcm1Nb2RlRnJlZUNvbm5lY3Rvcihjb25uZWN0
b3IpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
