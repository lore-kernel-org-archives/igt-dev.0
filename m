Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B8ED6E3FC
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 12:29:08 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 20 Jun 2019 15:29:00 +0300
Message-Id: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/3] runner/executor: Make sure that
 intervals_left is always initialized
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

aW50ZXJ2YWxzX2xlZnQgZ290IGluaXRpYWxpemVkIG9ubHkgd2hlbiB3aGVuIHdlIGhhZCBhIHRp
bWVvdXQgZXhjZWVkaW5nCndhdGNoZG9nIGNhcGFiaWxpdGllcywgbWVhbmluZyB3ZSBoYWQgdG8g
dXNlIG11bHRpcGxlIHNob3J0ZXIgaW50ZXJ2YWxzCgpieSBtb3ZpbmcgaW50ZXJ2YWxzX2xlZnQg
PSB0aW1lb3V0X2ludGVydmFscyBkb3duIHdlIGFyZSBhbHdheXMKaW5pdGlhbGl6aW5nIGl0CgpD
YzogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IEFya2FkaXVzeiBIaWxlciA8YXJrYWRpdXN6LmhpbGVyQGludGVsLmNvbT4KLS0tCiBydW5uZXIv
ZXhlY3V0b3IuYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0
b3IuYwppbmRleCA3ZTVmYmU4Zi4uYmNlNGQ0MjAgMTAwNjQ0Ci0tLSBhL3J1bm5lci9leGVjdXRv
ci5jCisrKyBiL3J1bm5lci9leGVjdXRvci5jCkBAIC00OTMsNyArNDkzLDYgQEAgc3RhdGljIGlu
dCBtb25pdG9yX291dHB1dChwaWRfdCBjaGlsZCwKIAkJCWlmICh3ZF90aW1lb3V0IC0gd2RfZXh0
cmEgPCAwKQogCQkJCXdkX2V4dHJhID0gd2RfdGltZW91dCAvIDI7CiAJCQl0aW1lb3V0X2ludGVy
dmFscyA9IHRpbWVvdXQgLyAod2RfdGltZW91dCAtIHdkX2V4dHJhKTsKLQkJCWludGVydmFsc19s
ZWZ0ID0gdGltZW91dF9pbnRlcnZhbHM7CiAJCQl0aW1lb3V0IC89IHRpbWVvdXRfaW50ZXJ2YWxz
OwogCiAJCQlpZiAoc2V0dGluZ3MtPmxvZ19sZXZlbCA+PSBMT0dfTEVWRUxfVkVSQk9TRSkgewpA
QCAtNTA0LDYgKzUwMyw4IEBAIHN0YXRpYyBpbnQgbW9uaXRvcl9vdXRwdXQocGlkX3QgY2hpbGQs
CiAJCX0KIAl9CiAKKwlpbnRlcnZhbHNfbGVmdCA9IHRpbWVvdXRfaW50ZXJ2YWxzOworCiAJd2hp
bGUgKG91dGZkID49IDAgfHwgZXJyZmQgPj0gMCB8fCBzaWdmZCA+PSAwKSB7CiAJCXN0cnVjdCB0
aW1ldmFsIHR2ID0geyAudHZfc2VjID0gdGltZW91dCB9OwogCi0tIAoyLjIxLjAKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
