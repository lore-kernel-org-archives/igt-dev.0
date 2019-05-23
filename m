Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2727E89E3E
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:26:57 +0300
Message-Id: <20190523122727.6932-6-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 06/36] i915/gem_linear_blits: Nuke custom
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
LQogdGVzdHMvaTkxNS9nZW1fbGluZWFyX2JsaXRzLmMgfCA2ICstLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5
MTUvZ2VtX2xpbmVhcl9ibGl0cy5jIGIvdGVzdHMvaTkxNS9nZW1fbGluZWFyX2JsaXRzLmMKaW5k
ZXggNmFmYTRlOWMuLmE1MzU5Mjg4IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9saW5lYXJf
YmxpdHMuYworKysgYi90ZXN0cy9pOTE1L2dlbV9saW5lYXJfYmxpdHMuYwpAQCAtMjIwLDEyICsy
MjAsMTAgQEAgc3RhdGljIHZvaWQgcnVuX3Rlc3QoaW50IGZkLCBpbnQgY291bnQpCiAKICNkZWZp
bmUgTUFYXzMyYiAoKDF1bGwgPDwgMzIpIC0gNDA5NikKIAotaW50IG1haW4oaW50IGFyZ2MsIGNo
YXIgKiphcmd2KQoraWd0X21haW4KIHsKIAlpbnQgZmQgPSAwOwogCi0JaWd0X3N1YnRlc3RfaW5p
dChhcmdjLCBhcmd2KTsKLQogCWlndF9maXh0dXJlIHsKIAkJZmQgPSBkcm1fb3Blbl9kcml2ZXIo
RFJJVkVSX0lOVEVMKTsKIAkJaWd0X3JlcXVpcmVfZ2VtKGZkKTsKQEAgLTI2MSw2ICsyNTksNCBA
QCBpbnQgbWFpbihpbnQgYXJnYywgY2hhciAqKmFyZ3YpCiAJCXJ1bl90ZXN0KGZkLCBjb3VudCk7
CiAJCWlndF9zdG9wX3NpZ25hbF9oZWxwZXIoKTsKIAl9Ci0KLQlpZ3RfZXhpdCgpOwogfQotLSAK
Mi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
