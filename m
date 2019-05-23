Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A32D89E47
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:19 +0300
Message-Id: <20190523122727.6932-28-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 28/36] kms_mmap_write_crc: Nuke custom main
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
LQogdGVzdHMva21zX21tYXBfd3JpdGVfY3JjLmMgfCAxMCArKysrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgNCBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc19tbWFwX3dyaXRlX2NyYy5jIGIvdGVzdHMva21zX21tYXBfd3JpdGVfY3JjLmMKaW5kZXgg
YmYyYjBjMjkuLjczNjA2YjE2IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfbW1hcF93cml0ZV9jcmMu
YworKysgYi90ZXN0cy9rbXNfbW1hcF93cml0ZV9jcmMuYwpAQCAtMjU4LDE4ICsyNTgsMTggQEAg
c3RhdGljIGludCBvcHRfaGFuZGxlcihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkICpkYXRh
KQogCWlmIChvcHQgPT0gJ24nKSB7CiAJCWlvY3RsX3N5bmMgPSBmYWxzZTsKIAkJaWd0X2luZm8o
InNldCB2aWEgY21kIGxpbmUgdG8gbm90IHVzZSBzeW5jIGlvY3Rsc1xuIik7CisJfSBlbHNlIHsK
KwkJcmV0dXJuIElHVF9PUFRfSEFORExFUl9FUlJPUjsKIAl9CiAKLQlyZXR1cm4gMDsKKwlyZXR1
cm4gSUdUX09QVF9IQU5ETEVSX1NVQ0NFU1M7CiB9CiAKIHN0YXRpYyBkYXRhX3QgZGF0YTsKIAot
aW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQoraWd0X21haW5fYXJncygibiIsIE5VTEws
IE5VTEwsIG9wdF9oYW5kbGVyLCBOVUxMKQogewogCWludCBpOwotCWlndF9zdWJ0ZXN0X2luaXRf
cGFyc2Vfb3B0cygmYXJnYywgYXJndiwgIm4iLCBOVUxMLCBOVUxMLAotCQkJCSAgICBvcHRfaGFu
ZGxlciwgTlVMTCk7CiAKIAlpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uKCk7CiAKQEAgLTI5OSw2ICsy
OTksNCBAQCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAKIAkJaWd0X3N0b3BfaGVs
cGVyKCZob2cpOwogCX0KLQotCWlndF9leGl0KCk7CiB9Ci0tIAoyLjE5LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
