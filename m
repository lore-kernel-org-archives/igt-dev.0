Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5907D6E10D
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Sep 2018 20:39:40 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu, 13 Sep 2018 13:39:34 -0700
Message-Id: <20180913203935.18543-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 1/2] lib: Require drmModeResources()
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
List-ID: <igt-dev@lists.freedesktop.org>

RnJvbTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+CgpJZiBtb2Rlc2V0
dGluZyBpcyBub3Qgc3VwcG9ydGVkLCB0aGUgZHJtTW9kZUdldFJlc291cmNlcygpIGNhbGwgd2ls
bApmYWlsIHdpdGggLUVJTlZBTCAob3IgLUVOT1RTVVBQKS4gQXMgbm8gZGlzcGxheXMgYXJlIGNv
bm5lY3RlZCwgc2tpcC4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hyaXMt
d2lsc29uLmNvLnVrPgotLS0KIGxpYi9pZ3Rfa21zLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5j
IGIvbGliL2lndF9rbXMuYwppbmRleCA0NTYzYmZkOS4uYzIwY2YxZWIgMTAwNjQ0Ci0tLSBhL2xp
Yi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMTg1Nyw3ICsxODU3LDcgQEAgdm9p
ZCBpZ3RfZGlzcGxheV9pbml0KGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGludCBkcm1fZmQpCiAJ
ZGlzcGxheS0+ZHJtX2ZkID0gZHJtX2ZkOwogCiAJcmVzb3VyY2VzID0gZHJtTW9kZUdldFJlc291
cmNlcyhkaXNwbGF5LT5kcm1fZmQpOwotCWlndF9hc3NlcnQocmVzb3VyY2VzKTsKKwlpZ3RfcmVx
dWlyZShyZXNvdXJjZXMpOwogCiAJLyoKIAkgKiBXZSBjYWNoZSB0aGUgbnVtYmVyIG9mIHBpcGVz
LCB0aGF0IG51bWJlciBpcyBhIHBoeXNpY2FsIGxpbWl0IG9mIHRoZQotLSAKMi4xOS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
