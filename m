Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm0-x243.google.com (mail-wm0-x243.google.com
 [IPv6:2a00:1450:400c:c09::243])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9E4E6E4CF
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Sep 2018 09:33:12 +0000 (UTC)
Received: by mail-wm0-x243.google.com with SMTP id n11-v6so1591339wmc.2
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Sep 2018 02:33:12 -0700 (PDT)
From: Tvrtko Ursulin <tursulin@ursulin.net>
Date: Wed, 12 Sep 2018 10:33:05 +0100
Message-Id: <20180912093306.23537-1-tvrtko.ursulin@linux.intel.com>
Subject: [igt-dev] [PATH i-g-t 1/2] intel: Be consistent with test results
 on simulation
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
Cc: Intel-gfx@lists.freedesktop.org, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGludGVsLmNvbT4KClRlc3RzIHdo
aWNoIGNhbGwgaW50ZWxfcmVxdWlyZV9tZW1vcnkgY3VycmVudGx5IGFsd2F5cyBza2lwIG9uIHNp
bXVsYXRpb24sCnVubGVzcyB0aGV5IGZhaWwgZmlyc3QgZHVlIGluc3VmZmljaWVudCBtZW1vcnku
IFRoaXMgY2FuIGNyZWF0ZSBkaWZmZXJlbnQKb3V0Y29tZXMgZGVwZW5kaW5nIG9uIHRoZSBzaW11
bGF0aW9uIGVudmlyb25tZW50IHNvIG1vdmUgdGhlIHNpbXVsYXRpb24Kc2tpcCB0byB0aGUgc3Rh
cnQgb2YgdGhlIGZ1bmN0aW9uIGZvciAxMDAlIGNvbnNpc3RlbmN5IGluIHJlc3VsdHMuCgpTaWdu
ZWQtb2ZmLWJ5OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgpDYzog
UmFkb3NsYXcgU3p3aWNodGVuYmVyZyA8cmFkb3NsYXcuc3p3aWNodGVuYmVyZ0BpbnRlbC5jb20+
Ci0tLQogbGliL2ludGVsX29zLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGliL2ludGVsX29zLmMgYi9saWIv
aW50ZWxfb3MuYwppbmRleCAyOWEyNzI3MmU3ODIuLmUxZTMxZTIzMDY5YiAxMDA2NDQKLS0tIGEv
bGliL2ludGVsX29zLmMKKysrIGIvbGliL2ludGVsX29zLmMKQEAgLTM3NSw2ICszNzUsOCBAQCB2
b2lkIGludGVsX3JlcXVpcmVfbWVtb3J5KHVpbnQ2NF90IGNvdW50LCB1aW50NjRfdCBzaXplLCB1
bnNpZ25lZCBtb2RlKQogCXVpbnQ2NF90IHJlcXVpcmVkLCB0b3RhbDsKIAlib29sIHN1ZmZpY2ll
bnRfbWVtb3J5OwogCisJaWd0X3NraXBfb25fc2ltdWxhdGlvbigpOworCiAJc3VmZmljaWVudF9t
ZW1vcnkgPSBfX2ludGVsX2NoZWNrX21lbW9yeShjb3VudCwgc2l6ZSwgbW9kZSwKIAkJCQkJCSAm
cmVxdWlyZWQsICZ0b3RhbCk7CiAJaWYgKCFzdWZmaWNpZW50X21lbW9yeSkgewpAQCAtNDA2LDgg
KzQwOCw2IEBAIHZvaWQgaW50ZWxfcmVxdWlyZV9tZW1vcnkodWludDY0X3QgY291bnQsIHVpbnQ2
NF90IHNpemUsIHVuc2lnbmVkIG1vZGUpCiAJCSAgICAgIG1vZGUgJiAoQ0hFQ0tfUkFNIHwgQ0hF
Q0tfU1dBUCkgPyAiUkFNIiA6ICIiLAogCQkgICAgICBtb2RlICYgQ0hFQ0tfU1dBUCA/ICIgKyBz
d2FwIjogIiIsCiAJCSAgICAgIChsb25nIGxvbmcpdmZzX2ZpbGVfbWF4KCkpOwotCi0JaWd0X3Nr
aXBfb25fc2ltdWxhdGlvbigpOwogfQogCiB2b2lkIGludGVsX3B1cmdlX3ZtX2NhY2hlcyhpbnQg
ZHJtX2ZkKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
