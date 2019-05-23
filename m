Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4337789E41
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:25 +0300
Message-Id: <20190523122727.6932-34-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 34/36] prime_mmap_coherency: Nuke custom
 main function
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
LQogdGVzdHMvcHJpbWVfbW1hcF9jb2hlcmVuY3kuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMvcHJp
bWVfbW1hcF9jb2hlcmVuY3kuYyBiL3Rlc3RzL3ByaW1lX21tYXBfY29oZXJlbmN5LmMKaW5kZXgg
MDRiMTVkZGQuLjM5NTM4NzY3IDEwMDY0NAotLS0gYS90ZXN0cy9wcmltZV9tbWFwX2NvaGVyZW5j
eS5jCisrKyBiL3Rlc3RzL3ByaW1lX21tYXBfY29oZXJlbmN5LmMKQEAgLTI3OSwxMCArMjc5LDgg
QEAgc3RhdGljIHZvaWQgdGVzdF9pb2N0bF9lcnJvcnModm9pZCkKIAl9CiB9CiAKLWludCBtYWlu
KGludCBhcmdjLCBjaGFyICoqYXJndikKK2lndF9tYWluCiB7Ci0JaWd0X3N1YnRlc3RfaW5pdChh
cmdjLCBhcmd2KTsKLQogCWlndF9maXh0dXJlIHsKIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIoRFJJ
VkVSX0lOVEVMKTsKIAkJaWd0X3JlcXVpcmVfZ2VtKGZkKTsKQEAgLTMyMSw2ICszMTksNCBAQCBp
bnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAKIAkJY2xvc2UoZmQpOwogCX0KLQotCWln
dF9leGl0KCk7CiB9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
aWd0LWRldg==
