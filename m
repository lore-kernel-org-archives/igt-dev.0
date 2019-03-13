Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96F706E043
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Mar 2019 12:06:46 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed, 13 Mar 2019 14:06:39 +0200
Message-Id: <20190313120641.7350-2-petri.latvala@intel.com>
In-Reply-To: <20190313120641.7350-1-petri.latvala@intel.com>
References: <20190313120641.7350-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/4] gem_exec_fence: Really loop through all
 engines
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

Q29udGludWUgaW5zdGVhZCBvZiBicmVha2luZyBvbiB0aGUgZmlyc3QgZW5naW5lLgoKU2lnbmVk
LW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNjOiBDaHJp
cyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9l
eGVjX2ZlbmNlLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9leGVjX2ZlbmNlLmMgYi90ZXN0
cy9pOTE1L2dlbV9leGVjX2ZlbmNlLmMKaW5kZXggYmE0NjU5NWQuLmM2NjYxNjI2IDEwMDY0NAot
LS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2ZlbmNlLmMKKysrIGIvdGVzdHMvaTkxNS9nZW1fZXhl
Y19mZW5jZS5jCkBAIC0yNzQsNyArMjc0LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9mZW5jZV9idXN5
X2FsbChpbnQgZmQsIHVuc2lnbmVkIGZsYWdzKQogCiAJCWlmIChhbGwgPCAwKSB7CiAJCQlhbGwg
PSBmZW5jZTsKLQkJCWJyZWFrOworCQkJY29udGludWU7CiAJCX0KIAogCQluZXcgPSBzeW5jX2Zl
bmNlX21lcmdlKGFsbCwgZmVuY2UpOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXY=
