Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405456EFCE
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:44 +0200
Message-Id: <20190116112050.27647-16-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 15/21] igt_aux: Handle empty pm_test file
 gracefully
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

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNj
OiBJbXJlIERlYWsgPGltcmUuZGVha0BpbnRlbC5jb20+Ci0tLQogbGliL2lndF9hdXguYyB8IDMg
KysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvbGliL2ln
dF9hdXguYyBiL2xpYi9pZ3RfYXV4LmMKaW5kZXggMTI1MGQ1YzUuLmU5YmYwNzI4IDEwMDY0NAot
LS0gYS9saWIvaWd0X2F1eC5jCisrKyBiL2xpYi9pZ3RfYXV4LmMKQEAgLTcxOCw2ICs3MTgsOSBA
QCBzdGF0aWMgZW51bSBpZ3Rfc3VzcGVuZF90ZXN0IGdldF9zdXNwZW5kX3Rlc3QoaW50IHBvd2Vy
X2RpcikKIAkJCWJyZWFrOwogCQl9CiAKKwlpZiAoIXRlc3RfbmFtZSkKKwkJcmV0dXJuIFNVU1BF
TkRfVEVTVF9OT05FOworCiAJZm9yICh0ZXN0ID0gU1VTUEVORF9URVNUX05PTkU7IHRlc3QgPCBT
VVNQRU5EX1RFU1RfTlVNOyB0ZXN0KyspCiAJCWlmIChzdHJjbXAoc3VzcGVuZF90ZXN0X25hbWVb
dGVzdF0sIHRlc3RfbmFtZSkgPT0gMCkKIAkJCWJyZWFrOwotLSAKMi4xOS4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
