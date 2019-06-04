Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3E489B7D
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jun 2019 18:01:17 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Tue,  4 Jun 2019 23:25:56 +0530
Message-Id: <20190604175601.14735-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v7 0/5] Enabling PC8+ residency for all
 GEN9+ platforms v7
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

VGhpcyBwYXRjaCBzZXJpZXMgZW5hYmxlIFBDOCsgcmVzaWRlbmN5IHRlc3QsIGVhcmxpZXIgdGhl
c2UgdGVzdHMKd2VyZSBvbmx5IGVuYWJsZWQgZm9yIEhhc3dlbGwgYW5kIEJyb2Fkd2VsbC4KCkFk
ZHJlc3NlZCBtaW5vciByZXZpZXcgY29tbWVudCBwcm92aWRlZCBieSBSYW0gb24gcmV2aXNpb24g
NS4KCkFkZGVkIGEgZGVidWcgdGVzdCB0byB2YWxpZGF0ZSBwYzggd2l0aCBhbGwgcGxhbmVzIGFu
ZCBhbGwgcGlwZXMKZW5hYmxlZCBpbiBvcmRlciBjb25maXJtIHBsYXRmb3JtIGNhbiBlbnRlciB0
byBwYzggd2l0aCBhbGwgc2NyZWVuIG9uLgoKRWFybGllciBwYzgtcmVzaWRlbmN5IHN1Yi10ZXN0
IHdlcmUgZmFpbGluZyBvbiBtb3N0IG9mIEdlbiA5CnBsYXRmb3Jtcywgc28gdHJ5aW5nIHBjOC1y
ZXNpZGVuY3kgc3ViIHRlc3QgYWZ0ZXIgc2V0dGluZyB1cCBwb3dlcnRvcAphbmQgZHVtcGluZyB0
aGUgcG1jIHN5c2ZzIGF0dHJpYnV0ZXMuCgpBbnNodW1hbiBHdXB0YSAoNSk6CiAgdGVzdHMvaTkx
NS9pOTE1X3BtX3JwbTogRW5hYmxlIFBDOCsgcmVzaWRlbmN5IHRlc3QgZm9yIGFsbCBHZW45Kwog
IHRlc3RzL2k5MTUvaTkxNV9wbV9ycG06IG1vZGVzZXQtcGM4LXJlc2lkZW5jeS1zdHJlc3MKICBE
RUJVRzogaW52b2tlIHBvd2VydG9wIGFuZCBwbWMgbHRyX2lnbm9yZSB3aGVuIHBjOCB0ZXN0cyBm
YWlscy4KICBERUJVRzpzdWItdGVzdCB0byBjaGVjayBwYzggYWZ0ZXIgZW5hYmxpbmcgYWxsIHBs
YW5lcyBvbiBhbGwgcGlwZXMuCiAgRE9fTk9UX01FUkdFOiBhZGRpbmcgaTkxNV9wbV9ycG0gcGM4
IHN1YnRlc3QgdG8gZmFzdCBmZWVkYmFjayBsaXN0LgoKIHRlc3RzL2k5MTUvaTkxNV9wbV9ycG0u
YyAgICAgICAgICAgICAgfCA0MzAgKysrKysrKysrKysrKysrKysrKysrKysrKy0KIHRlc3RzL2lu
dGVsLWNpL2Zhc3QtZmVlZGJhY2sudGVzdGxpc3QgfCAgIDQgKwogMiBmaWxlcyBjaGFuZ2VkLCA0
MjQgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
