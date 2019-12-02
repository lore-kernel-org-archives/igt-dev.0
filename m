Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EAB689F61
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Dec 2019 06:14:15 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Mon,  2 Dec 2019 11:31:31 +0530
Message-Id: <20191202060132.31907-7-swati2.sharma@intel.com>
In-Reply-To: <20191202060132.31907-1-swati2.sharma@intel.com>
References: <20191202060132.31907-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 6/7] benchmarks: remove
 igt_skip_on_simulation()
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
Cc: lucas.demarchi@intel.com, martin.peres@intel.com, maarten.lankhorst@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

UmVtb3ZpbmcgaWd0X3NraXBfb25fc2ltdWxhdGlvbigpIGZyb20gYmVuY2htYXJrcyBzaW5jZQp0
aGlzIGZlYXR1cmUgaXMgbm90IHN1cHBvcnRlZCBhbnltb3JlLgoKdjI6IFJlYmFzZQoKU2lnbmVk
LW9mZi1ieTogU3dhdGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4KU2lnbmVkLW9m
Zi1ieTogS2FydGhpayBCIFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4KUmV2aWV3ZWQtYnk6IE1h
cnRpbiBQZXJlcyA8bWFydGluLnBlcmVzQGxpbnV4LmludGVsLmNvbT4KLS0tCiBiZW5jaG1hcmtz
L2dlbV91c2VycHRyX2JlbmNobWFyay5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYmVuY2htYXJrcy9nZW1fdXNlcnB0cl9iZW5jaG1hcmsuYyBi
L2JlbmNobWFya3MvZ2VtX3VzZXJwdHJfYmVuY2htYXJrLmMKaW5kZXggYmVmMmNjYzQuLmI2M2Zk
ZWRmIDEwMDY0NAotLS0gYS9iZW5jaG1hcmtzL2dlbV91c2VycHRyX2JlbmNobWFyay5jCisrKyBi
L2JlbmNobWFya3MvZ2VtX3VzZXJwdHJfYmVuY2htYXJrLmMKQEAgLTQ2OSw4ICs0NjksNiBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiB7CiAJaW50IGZkID0gLTEsIHJldDsKIAot
CWlndF9za2lwX29uX3NpbXVsYXRpb24oKTsKLQogCWlndF9zdWJ0ZXN0X2luaXQoYXJnYywgYXJn
dik7CiAKIAlmZCA9IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwotLSAKMi4yMy4wCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
