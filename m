Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03688926E
 for <igt-dev@lists.freedesktop.org>; Thu, 11 Apr 2019 09:40:17 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 11 Apr 2019 12:40:12 +0300
Message-Id: <20190411094012.4288-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Make sure oom-killer doesn't kill
 the runner
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

VGVzdHMgdGhhdCBlYXQgYWxsIG9mIHRoZSBSQU0gYW5kIHRoZW4gc29tZSB0byBpbnZva2UgdGhl
IG9vbS1raWxsZXIKZGVsaWJlcmF0ZWx5IHNvbWV0aW1lcyBjYXVzZSBleHRyYSBjYXN1YWx0aWVz
LiBNYWtlIHN1cmUgdGhlIHJ1bm5lcgpzdGF5cyBhbGl2ZS4KClNpZ25lZC1vZmYtYnk6IFBldHJp
IExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9leGVjdXRvci5j
IHwgMTggKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygr
KQoKZGlmZiAtLWdpdCBhL3J1bm5lci9leGVjdXRvci5jIGIvcnVubmVyL2V4ZWN1dG9yLmMKaW5k
ZXggMGU5MWI3YWIuLjdlNWZiZThmIDEwMDY0NAotLS0gYS9ydW5uZXIvZXhlY3V0b3IuYworKysg
Yi9ydW5uZXIvZXhlY3V0b3IuYwpAQCAtMTIyMSw2ICsxMjIxLDIyIEBAIHN0YXRpYyB2b2lkIHdy
aXRlX2Fib3J0X2ZpbGUoaW50IHJlc2RpcmZkLAogCX0KIH0KIAorc3RhdGljIHZvaWQgb29tX2lt
bW9ydGFsKHZvaWQpCit7CisJaW50IGZkOworCWNvbnN0IGNoYXIgbmV2ZXJfa2lsbFtdID0gIi0x
MDAwIjsKKworCWZkID0gb3BlbigiL3Byb2Mvc2VsZi9vb21fc2NvcmVfYWRqIiwgT19XUk9OTFkp
OworCWlmIChmZCA8IDApIHsKKwkJZnByaW50ZihzdGRlcnIsICJXYXJuaW5nOiBDYW5ub3QgYWRq
dXN0IG9vbSBzY29yZS5cbiIpOworCQlyZXR1cm47CisJfQorCWlmICh3cml0ZShmZCwgbmV2ZXJf
a2lsbCwgc2l6ZW9mKG5ldmVyX2tpbGwpKSAhPSBzaXplb2YobmV2ZXJfa2lsbCkpCisJCWZwcmlu
dGYoc3RkZXJyLCAiV2FybmluZzogQWRqdXN0aW5nIG9vbSBzY29yZSBmYWlsZWQuXG4iKTsKKwor
CWNsb3NlKGZkKTsKK30KKwogYm9vbCBleGVjdXRlKHN0cnVjdCBleGVjdXRlX3N0YXRlICpzdGF0
ZSwKIAkgICAgIHN0cnVjdCBzZXR0aW5ncyAqc2V0dGluZ3MsCiAJICAgICBzdHJ1Y3Qgam9iX2xp
c3QgKmpvYl9saXN0KQpAQCAtMTI2OCw2ICsxMjg0LDggQEAgYm9vbCBleGVjdXRlKHN0cnVjdCBl
eGVjdXRlX3N0YXRlICpzdGF0ZSwKIAkJY2xvc2UodGltZWZkKTsKIAl9CiAKKwlvb21faW1tb3J0
YWwoKTsKKwogCWluaXRfd2F0Y2hkb2dzKHNldHRpbmdzKTsKIAogCWlmICghdW5hbWUoJnVuYW1l
YnVmKSkgewotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXY=
