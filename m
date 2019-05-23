Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB9D89E50
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:21 +0300
Message-Id: <20190523122727.6932-30-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 30/36] kms_psr2_su: Nuke custom main function
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
LQogdGVzdHMva21zX3BzcjJfc3UuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNl
cnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3BzcjJfc3Uu
YyBiL3Rlc3RzL2ttc19wc3IyX3N1LmMKaW5kZXggYjlhNTc1ODIuLmE5ZjY3NWQxIDEwMDY0NAot
LS0gYS90ZXN0cy9rbXNfcHNyMl9zdS5jCisrKyBiL3Rlc3RzL2ttc19wc3IyX3N1LmMKQEAgLTIy
OCwxMiArMjI4LDEwIEBAIHN0YXRpYyB2b2lkIGNsZWFudXAoZGF0YV90ICpkYXRhKQogCWlndF9y
ZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0YS0+ZmJbMF0pOwogfQogCi1pbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqYXJndltdKQoraWd0X21haW4KIHsKIAlkYXRhX3QgZGF0YSA9IHt9OwogCi0J
aWd0X3N1YnRlc3RfaW5pdF9wYXJzZV9vcHRzKCZhcmdjLCBhcmd2LCAiIiwgTlVMTCwKLQkJCQkg
ICAgTlVMTCwgTlVMTCwgTlVMTCk7CiAJaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOwogCiAJaWd0
X2ZpeHR1cmUgewpAQCAtMjg3LDYgKzI4NSw0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICph
cmd2W10pCiAJCWRybV9pbnRlbF9idWZtZ3JfZGVzdHJveShkYXRhLmJ1Zm1ncik7CiAJCWRpc3Bs
YXlfZmluaSgmZGF0YSk7CiAJfQotCi0JaWd0X2V4aXQoKTsKIH0KLS0gCjIuMTkuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5n
IGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
