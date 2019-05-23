Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64AF489E2B
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:04 +0300
Message-Id: <20190523122727.6932-13-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 13/36] i915/gem_request_retire: Nuke custom
 main function
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
LQogdGVzdHMvaTkxNS9nZW1fcmVxdWVzdF9yZXRpcmUuYyB8IDYgKy0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMv
aTkxNS9nZW1fcmVxdWVzdF9yZXRpcmUuYyBiL3Rlc3RzL2k5MTUvZ2VtX3JlcXVlc3RfcmV0aXJl
LmMKaW5kZXggZWExYzczMjcuLjMwNDg4MmUyIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9y
ZXF1ZXN0X3JldGlyZS5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3JlcXVlc3RfcmV0aXJlLmMKQEAg
LTIyMCwxMCArMjIwLDggQEAgdGVzdF9yZXRpcmVfdm1hX25vdF9pbmFjdGl2ZShpbnQgZmQpCiAK
IGludCBmZDsKIAotaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQoraWd0X21haW4KIHsK
LQlpZ3Rfc3VidGVzdF9pbml0KGFyZ2MsIGFyZ3YpOwotCiAJaWd0X2ZpeHR1cmUgewogCQlmZCA9
IGRybV9vcGVuX2RyaXZlcihEUklWRVJfSU5URUwpOwogCQlpZ3RfcmVxdWlyZV9nZW0oZmQpOwpA
QCAtMjMzLDYgKzIzMSw0IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICoqYXJndikKIAogCWln
dF9zdWJ0ZXN0KCJyZXRpcmUtdm1hLW5vdC1pbmFjdGl2ZSIpCiAJCXRlc3RfcmV0aXJlX3ZtYV9u
b3RfaW5hY3RpdmUoZmQpOwotCi0JaWd0X2V4aXQoKTsKIH0KLS0gCjIuMTkuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
