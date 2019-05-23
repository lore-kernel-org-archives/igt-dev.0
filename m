Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8879589E59
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:26:56 +0300
Message-Id: <20190523122727.6932-5-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 05/36] i915/gem_hang: Nuke custom main
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

VGhlIHBpcGUgcGFyYW1ldGVyLCBwcmV2aW91c2x5IGdvdHRlbiBmcm9tIGFyZ3ZbMV0sIGlzIG5v
dyB0aGUKcGFyYW1ldGVyIC1wLgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmku
bGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1faGFuZy5jIHwgMjUgKysrKysr
KysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEw
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2hhbmcuYyBiL3Rlc3Rz
L2k5MTUvZ2VtX2hhbmcuYwppbmRleCBmNTA2ZmM3MC4uMmM2MWNhYzAgMTAwNjQ0Ci0tLSBhL3Rl
c3RzL2k5MTUvZ2VtX2hhbmcuYworKysgYi90ZXN0cy9pOTE1L2dlbV9oYW5nLmMKQEAgLTY0LDE3
ICs2NCwyNCBAQCBncHVfaGFuZyh2b2lkKQogCWludGVsX2JhdGNoYnVmZmVyX2ZsdXNoKGJhdGNo
KTsKIH0KIAotaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQorc3RhdGljIGludCBvcHRf
aGFuZGxlcihpbnQgb3B0LCBpbnQgb3B0X2luZGV4LCB2b2lkICpkYXRhKQogewotCWludCBmZDsK
LQotCWlndF9zaW1wbGVfaW5pdChhcmdjLCBhcmd2KTsKKwlzd2l0Y2ggKG9wdCkgeworCWNhc2Ug
J3AnOgorCQliYWRfcGlwZSA9IGF0b2kob3B0YXJnKTsKKwkJYnJlYWs7CisJZGVmYXVsdDoKKwkJ
cmV0dXJuIElHVF9PUFRfSEFORExFUl9FUlJPUjsKKwl9CisKKwlyZXR1cm4gSUdUX09QVF9IQU5E
TEVSX1NVQ0NFU1M7Cit9CiAKLQlpZ3RfYXNzZXJ0X2YoYXJnYyA9PSAyLAotCQkgICAgICJ1c2Fn
ZTogJXMgPGRpc2FibGVkIHBpcGUgbnVtYmVyPlxuIiwKLQkJICAgICBhcmd2WzBdKTsKK2NvbnN0
IGNoYXIgKmhlbHBfc3RyID0gIiAgLXBcdERpc2FibGVkIHBpcGUgbnVtYmVyXG4iOwogCi0JYmFk
X3BpcGUgPSBhdG9pKGFyZ3ZbMV0pOworaWd0X3NpbXBsZV9tYWluX2FyZ3MoInA6IiwgTlVMTCwg
aGVscF9zdHIsIG9wdF9oYW5kbGVyLCBOVUxMKQoreworCWludCBmZDsKIAogCWZkID0gZHJtX29w
ZW5fZHJpdmVyKERSSVZFUl9JTlRFTCk7CiAKQEAgLTg4LDYgKzk1LDQgQEAgaW50IG1haW4oaW50
IGFyZ2MsIGNoYXIgKiphcmd2KQogCWRybV9pbnRlbF9idWZtZ3JfZGVzdHJveShidWZtZ3IpOwog
CiAJY2xvc2UoZmQpOwotCi0JaWd0X2V4aXQoKTsKIH0KLS0gCjIuMTkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QK
aWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
