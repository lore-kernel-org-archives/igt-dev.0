Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D033E6E8EE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Oct 2019 07:58:25 +0000 (UTC)
From: Swati Sharma <swati2.sharma@intel.com>
Date: Wed, 16 Oct 2019 13:19:11 +0530
Message-Id: <20191016074912.32290-7-swati2.sharma@intel.com>
In-Reply-To: <20191016074912.32290-1-swati2.sharma@intel.com>
References: <20191016074912.32290-1-swati2.sharma@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 6/7] benchmarks: remove igt_skip_on_simulation()
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
aGlzIGZlYXR1cmUgaXMgbm90IHN1cHBvcnRlZCBhbnltb3JlLgoKU2lnbmVkLW9mZi1ieTogU3dh
dGkgU2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogS2FydGhp
ayBCIFMgPGthcnRoaWsuYi5zQGludGVsLmNvbT4KLS0tCiBiZW5jaG1hcmtzL2dlbV91c2VycHRy
X2JlbmNobWFyay5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvYmVuY2htYXJrcy9nZW1fdXNlcnB0cl9iZW5jaG1hcmsuYyBiL2JlbmNobWFya3Mv
Z2VtX3VzZXJwdHJfYmVuY2htYXJrLmMKaW5kZXggYmVmMmNjYzQuLmI2M2ZkZWRmIDEwMDY0NAot
LS0gYS9iZW5jaG1hcmtzL2dlbV91c2VycHRyX2JlbmNobWFyay5jCisrKyBiL2JlbmNobWFya3Mv
Z2VtX3VzZXJwdHJfYmVuY2htYXJrLmMKQEAgLTQ2OSw4ICs0NjksNiBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqKmFyZ3YpCiB7CiAJaW50IGZkID0gLTEsIHJldDsKIAotCWlndF9za2lwX29u
X3NpbXVsYXRpb24oKTsKLQogCWlndF9zdWJ0ZXN0X2luaXQoYXJnYywgYXJndik7CiAKIAlmZCA9
IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwotLSAKMi4yMy4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
