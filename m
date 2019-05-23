Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5307C89E36
 for <igt-dev@lists.freedesktop.org>; Thu, 23 May 2019 12:27:39 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Thu, 23 May 2019 15:27:03 +0300
Message-Id: <20190523122727.6932-12-petri.latvala@intel.com>
In-Reply-To: <20190523122727.6932-1-petri.latvala@intel.com>
References: <20190523122727.6932-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 12/36] i915/gem_render_copy_redux: Nuke
 custom main function
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
LQogdGVzdHMvaTkxNS9nZW1fcmVuZGVyX2NvcHlfcmVkdXguYyB8IDYgKy0tLS0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVz
dHMvaTkxNS9nZW1fcmVuZGVyX2NvcHlfcmVkdXguYyBiL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl9j
b3B5X3JlZHV4LmMKaW5kZXggMjRiODM4YmEuLmVmNjAxYzIyIDEwMDY0NAotLS0gYS90ZXN0cy9p
OTE1L2dlbV9yZW5kZXJfY29weV9yZWR1eC5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3JlbmRlcl9j
b3B5X3JlZHV4LmMKQEAgLTIwMiwxMiArMjAyLDEwIEBAIHN0YXRpYyB2b2lkIGNvcHlfZmxpbmso
ZGF0YV90ICpkYXRhKQogCWRhdGFfZmluaSgmbG9jYWwpOwogfQogCi1pbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCitpZ3RfbWFpbgogewogCWRhdGFfdCBkYXRhID0gezAsIH07CiAKLQlp
Z3Rfc3VidGVzdF9pbml0KGFyZ2MsIGFyZ3YpOwotCiAJaWd0X2ZpeHR1cmUgewogCQlkYXRhX2lu
aXQoJmRhdGEpOwogCQlpZ3RfcmVxdWlyZV9nZW0oZGF0YS5mZCk7CkBAIC0yNDAsNiArMjM4LDQg
QEAgaW50IG1haW4oaW50IGFyZ2MsIGNoYXIgKiphcmd2KQogCQkJY29weV9mbGluaygmZGF0YSk7
CiAJCWlndF9zdG9wX3NpZ25hbF9oZWxwZXIoKTsKIAl9Ci0KLQlpZ3RfZXhpdCgpOwogfQotLSAK
Mi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
