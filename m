Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0CFA6E29A
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 11:25:43 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu,  7 Mar 2019 13:24:23 +0200
Message-Id: <20190307112427.29146-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] lib/aux: Plug memory leak in
 __igt_lsof_fds
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

QWRkIGEgbWlzc2luZyBjbG9zZWRpciBjYWxsLgoKU2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFs
YSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+Ci0tLQogbGliL2lndF9hdXguYyB8IDIgKysKIDEg
ZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5j
IGIvbGliL2lndF9hdXguYwppbmRleCBmZjk4ZDkxZC4uZTVkNDFlMzIgMTAwNjQ0Ci0tLSBhL2xp
Yi9pZ3RfYXV4LmMKKysrIGIvbGliL2lndF9hdXguYwpAQCAtMTQxOSw2ICsxNDE5LDggQEAgYWdh
aW46CiAJCWZyZWUoY29weV9mZF9sbmspOwogCQlmcmVlKGZkX2xuayk7CiAJfQorCisJY2xvc2Vk
aXIoZHApOwogfQogCiAvKgotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
