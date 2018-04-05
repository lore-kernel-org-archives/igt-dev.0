Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4177F6E72E
 for <igt-dev@lists.freedesktop.org>; Thu,  5 Apr 2018 10:50:01 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Thu,  5 Apr 2018 12:49:54 +0200
Message-Id: <20180405104954.6880-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/igt_debugfs: Add timeouts to opening
 pipe CRC fd.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyB3aWxsIGZpeCB0aGUgUFNSIHRlc3RzIHRvIGZhaWwgc2xpZ2h0bHkgZmFzdGVyLCBzaW5j
ZSB0aGV5IHdhaXQKaW5kZWZpbml0ZWx5IGZvciBhIENSQyB0aGF0IG5ldmVyIGNvbWVzIGR1cmlu
ZyBvcGVuLgoKU2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hv
cnN0QGxpbnV4LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2RlYnVnZnMuYyB8IDMgKysrCiAxIGZp
bGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2lndF9kZWJ1Z2Zz
LmMgYi9saWIvaWd0X2RlYnVnZnMuYwppbmRleCA4YWRjMDJlOWNjNDcuLjA5NGRmNTY0YjZmNCAx
MDA2NDQKLS0tIGEvbGliL2lndF9kZWJ1Z2ZzLmMKKysrIGIvbGliL2lndF9kZWJ1Z2ZzLmMKQEAg
LTc1Nyw3ICs3NTcsMTAgQEAgdm9pZCBpZ3RfcGlwZV9jcmNfc3RhcnQoaWd0X3BpcGVfY3JjX3Qg
KnBpcGVfY3JjKQogCiAJc3ByaW50ZihidWYsICJjcnRjLSVkL2NyYy9kYXRhIiwgcGlwZV9jcmMt
PnBpcGUpOwogCisJaWd0X3NldF90aW1lb3V0KDUsICJPcGVuaW5nIGNyYyBmZCwgd2hpY2ggd2Fp
dHMgZm9yIGZpcnN0IENSQy4iKTsKIAlwaXBlX2NyYy0+Y3JjX2ZkID0gb3BlbmF0KHBpcGVfY3Jj
LT5kaXIsIGJ1ZiwgcGlwZV9jcmMtPmZsYWdzKTsKKwlpZ3RfcmVzZXRfdGltZW91dCgpOworCiAJ
aWd0X2Fzc2VydChwaXBlX2NyYy0+Y3JjX2ZkICE9IC0xKTsKIAllcnJubyA9IDA7CiB9Ci0tIAoy
LjE2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
