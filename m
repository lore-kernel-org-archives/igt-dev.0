Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9CE89C86
 for <igt-dev@lists.freedesktop.org>; Wed, 22 May 2019 22:13:09 +0000 (UTC)
From: Andi Shyti <andi.shyti@intel.com>
Date: Thu, 23 May 2019 01:13:02 +0300
Message-Id: <20190522221302.2537-1-andi.shyti@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH] test/i915: gem_busy: fix misuse of the "flags"
 parameter in basic()
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
To: IGT dev <igt-dev@lists.freedesktop.org>
Cc: Andi Shyti <andi@etezian.org>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlICJmbGFncyIgcGFyYW1ldGVyIHJlY2VpdmVkIGJ5IHRoZSAiYmFzaWMoKSIgZnVuY3Rpb24g
Y2hlY2tzCmZvciB0aGUgSEFORyAoMHgyKSBiaXQsIHdoaWxlIGNhbGxlcnMgZ2l2ZSBpdCBhIGJv
b2xlYW4KdHJ1ZS9mYWxzZSB2YWx1ZS4KClJlc3RvcmUgdGhlIG9yaWdpbmFsIG1lYW5pbmcgb2Yg
ImZsYWdzIiBhcyBhIGJpdCBtYXNrLgoKRml4ZXM6IDg4MzE4YjA3NzFmOSAoInRlc3QvaTkxNTog
Z2VtX2J1c3k6IHVzZSB0aGUgZ2VtX2VuZ2luZV90b3BvbG9neSBsaWJyYXJ5IikKU2lnbmVkLW9m
Zi1ieTogQW5kaSBTaHl0aSA8YW5kaS5zaHl0aUBpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IFR2cnRrbyBVcnN1bGluIDx0dnJ0a28udXJz
dWxpbkBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1fYnVzeS5jIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L3Rlc3RzL2k5MTUvZ2VtX2J1c3kuYyBiL3Rlc3RzL2k5MTUvZ2VtX2J1c3kuYwppbmRleCAyODcy
ZTdiN2JlNjIuLjc4MWEzYmZhYjFkMSAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fYnVzeS5j
CisrKyBiL3Rlc3RzL2k5MTUvZ2VtX2J1c3kuYwpAQCAtNDgzLDcgKzQ4Myw3IEBAIGlndF9tYWlu
CiAJCQkJCSAgICAgIGUtPmNsYXNzID09IEk5MTVfRU5HSU5FX0NMQVNTX1JFTkRFUgogCQkJCQkg
ICAgICA/ICJiYXNpYy0iIDogIiIsIGUtPm5hbWUpIHsKIAkJCQkJZ2VtX3F1aWVzY2VudF9ncHUo
ZmQpOwotCQkJCQliYXNpYyhmZCwgZSwgZmFsc2UpOworCQkJCQliYXNpYyhmZCwgZSwgMCk7CiAJ
CQkJfQogCQkJfQogCQl9CkBAIC01NDgsNyArNTQ4LDcgQEAgaWd0X21haW4KIAkJCQkgICAgICA/
ICJiYXNpYy0iIDogIiIsIGUtPm5hbWUpIHsKIAkJCQlpZ3Rfc2tpcF9vbl9zaW11bGF0aW9uKCk7
CiAJCQkJZ2VtX3F1aWVzY2VudF9ncHUoZmQpOwotCQkJCWJhc2ljKGZkLCBlLCB0cnVlKTsKKwkJ
CQliYXNpYyhmZCwgZSwgSEFORyk7CiAJCQl9CiAJCX0KIAotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
