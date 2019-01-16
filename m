Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFCA46EFCF
 for <igt-dev@lists.freedesktop.org>; Wed, 16 Jan 2019 11:21:03 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 16 Jan 2019 13:20:37 +0200
Message-Id: <20190116112050.27647-9-petri.latvala@intel.com>
In-Reply-To: <20190116112050.27647-1-petri.latvala@intel.com>
References: <20190116112050.27647-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 08/21] benchmarks/wsim: Handle a parse error
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
Cc: Petri Latvala <petri.latvala@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNj
OiBUdnJ0a28gVXJzdWxpbiA8dHZydGtvLnVyc3VsaW5AaW50ZWwuY29tPgotLS0KIGJlbmNobWFy
a3MvZ2VtX3dzaW0uYyB8IDggKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9iZW5jaG1hcmtzL2dlbV93c2ltLmMgYi9iZW5jaG1hcmtzL2dlbV93
c2ltLmMKaW5kZXggZTA3MDk0ODcuLjVhNDc1M2Q5IDEwMDY0NAotLS0gYS9iZW5jaG1hcmtzL2dl
bV93c2ltLmMKKysrIGIvYmVuY2htYXJrcy9nZW1fd3NpbS5jCkBAIC00ODMsNiArNDgzLDE0IEBA
IHBhcnNlX3dvcmtsb2FkKHN0cnVjdCB3X2FyZyAqYXJnLCB1bnNpZ25lZCBpbnQgZmxhZ3MsIHN0
cnVjdCB3b3JrbG9hZCAqYXBwX3cpCiAJCQkJZ290byBhZGRfc3RlcDsKIAkJCX0KIAorCQkJaWYg
KCFmaWVsZCkgeworCQkJCWlmICh2ZXJib3NlKQorCQkJCQlmcHJpbnRmKHN0ZGVyciwKKwkJCQkJ
CSJQYXJzZSBlcnJvciBhdCBzdGVwICV1IVxuIiwKKwkJCQkJCW5yX3N0ZXBzKTsKKwkJCQlyZXR1
cm4gTlVMTDsKKwkJCX0KKwogCQkJdG1wID0gYXRvaShmaWVsZCk7CiAJCQlpZiAodG1wIDwgMCkg
ewogCQkJCWlmICh2ZXJib3NlKQotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
