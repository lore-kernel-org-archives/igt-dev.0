Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0856989E39
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:38 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:26:58 +0300
Message-Id: <20190523122727.6932-7-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 07/36] i915/gem_ppgtt: Nuke custom main
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
LQogdGVzdHMvaTkxNS9nZW1fcHBndHQuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvaTkxNS9nZW1f
cHBndHQuYyBiL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKaW5kZXggYWU5ODY5YzIuLmI5MDVlYTU1
IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2Vt
X3BwZ3R0LmMKQEAgLTMzMCwxMCArMzMwLDggQEAgc3RhdGljIHZvaWQgZmxpbmtfYW5kX2V4aXQo
dm9pZCkKIH0KIAogI2RlZmluZSBOX0NISUxEIDgKLWludCBtYWluKGludCBhcmdjLCBjaGFyICoq
YXJndikKK2lndF9tYWluCiB7Ci0JaWd0X3N1YnRlc3RfaW5pdChhcmdjLCBhcmd2KTsKLQogCWln
dF9maXh0dXJlIHsKIAkJaW50IGZkID0gZHJtX29wZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CiAJ
CWlndF9yZXF1aXJlX2dlbShmZCk7CkBAIC0zNjksNiArMzY3LDQgQEAgaW50IG1haW4oaW50IGFy
Z2MsIGNoYXIgKiphcmd2KQogCiAJaWd0X3N1YnRlc3QoImZsaW5rLWFuZC1leGl0LXZtYS1sZWFr
IikKIAkJZmxpbmtfYW5kX2V4aXQoKTsKLQotCWlndF9leGl0KCk7CiB9Ci0tIAoyLjE5LjEKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFp
bGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
