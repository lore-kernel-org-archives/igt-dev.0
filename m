Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A8D6893A2
 for <igt-dev@lists.freedesktop.org>; Tue,  9 Jul 2019 12:23:57 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Tue,  9 Jul 2019 15:23:44 +0300
Message-Id: <20190709122345.29180-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190709122345.29180-1-arkadiusz.hiler@intel.com>
References: <20190709122345.29180-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] runner: Warn when watchdogs are being
 closed from the exit handler
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

aW5zdGVhZCBvZiBiZWluZyBjbG9zZWQgbm9ybWFsbHkgb24gYSBncmFjZWZ1bCBjb2RlIHBhdGgK
CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHJ1bm5l
ci9leGVjdXRvci5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9ydW5uZXIvZXhlY3V0b3IuYyBiL3J1bm5lci9leGVjdXRvci5jCmluZGV4IGFm
MDJjNWE4Li42NDYzYWI5NiAxMDA2NDQKLS0tIGEvcnVubmVyL2V4ZWN1dG9yLmMKKysrIGIvcnVu
bmVyL2V4ZWN1dG9yLmMKQEAgLTQzLDYgKzQzLDkgQEAgc3RhdGljIHZvaWQgY2xvc2Vfd2F0Y2hk
b2dzKHN0cnVjdCBzZXR0aW5ncyAqc2V0dGluZ3MpCiAJaWYgKHNldHRpbmdzICYmIHNldHRpbmdz
LT5sb2dfbGV2ZWwgPj0gTE9HX0xFVkVMX1ZFUkJPU0UpCiAJCXByaW50ZigiQ2xvc2luZyB3YXRj
aGRvZ3NcbiIpOwogCisJaWYgKHNldHRpbmdzID09IE5VTEwgJiYgd2F0Y2hkb2dzLm51bV9kb2dz
ICE9IDApCisJCWZwcmludGYoc3RkZXJyLCAiQ2xvc2luZyB3YXRjaGRvZ3MgZnJvbSBleGl0IGhh
bmRsZXIhXG4iKTsKKwogCWZvciAoaSA9IDA7IGkgPCB3YXRjaGRvZ3MubnVtX2RvZ3M7IGkrKykg
ewogCQlfX2Nsb3NlX3dhdGNoZG9nKHdhdGNoZG9ncy5mZHNbaV0pOwogCX0KLS0gCjIuMjEuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
