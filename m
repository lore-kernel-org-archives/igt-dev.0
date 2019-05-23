Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066B589E2C
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:38 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:26:54 +0300
Message-Id: <20190523122727.6932-3-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 03/36] i915/gem_exec_blt: Nuke custom main
 function
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

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0t
LQogdGVzdHMvaTkxNS9nZW1fZXhlY19ibHQuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9n
ZW1fZXhlY19ibHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfYmx0LmMKaW5kZXggMDA5MjZlNTUu
Ljk0ZGUxYTgyIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2JsdC5jCisrKyBiL3Rl
c3RzL2k5MTUvZ2VtX2V4ZWNfYmx0LmMKQEAgLTI5Myw3ICsyOTMsNyBAQCBzdGF0aWMgdm9pZCBz
ZXRfbWF4X2ZyZXEoaW50IHN5c2ZzKQogfQogCiAKLWludCBtYWluKGludCBhcmdjLCBjaGFyICoq
YXJndikKK2lndF9tYWluCiB7CiAJY29uc3Qgc3RydWN0IHsKIAkJY29uc3QgY2hhciAqc3VmZml4
OwpAQCAtMzA3LDggKzMwNyw2IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAlp
bnQgbWluID0gLTEsIG1heCA9IC0xOwogCWludCBmZCwgc3lzZnM7CiAKLQlpZ3Rfc3VidGVzdF9p
bml0KGFyZ2MsIGFyZ3YpOwotCiAJaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOwogCiAJaWd0X2Zp
eHR1cmUgewpAQCAtMzQ0LDYgKzM0Miw0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJn
dikKIAkJY2xvc2Uoc3lzZnMpOwogCQljbG9zZShmZCk7CiAJfQotCi0JaWd0X2V4aXQoKTsKIH0K
LS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
