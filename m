Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CAFA898F1
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Jun 2019 12:16:14 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Wed,  5 Jun 2019 15:16:07 +0300
Message-Id: <20190605121607.28014-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] runner: Also consider TAINT_MACHINE_CHECK
 as abortable taint
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
OiBNaWthIEt1b3BwYWxhIDxtaWthLmt1b3BwYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBydW5u
ZXIvZXhlY3V0b3IuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvcnVubmVyL2V4ZWN1dG9yLmMgYi9ydW5uZXIvZXhlY3V0b3IuYwppbmRleCA3ZTVm
YmU4Zi4uNjllZjIxZTUgMTAwNjQ0Ci0tLSBhL3J1bm5lci9leGVjdXRvci5jCisrKyBiL3J1bm5l
ci9leGVjdXRvci5jCkBAIC0xNDIsNiArMTQyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCB7CiAJ
dW5zaWduZWQgbG9uZyBiaXQ7CiAJY29uc3QgY2hhciAqZXhwbGFuYXRpb247CiB9IGFib3J0X3Rh
aW50c1tdID0geworICB7KDEgPDwgNCksICJUQUlOVF9NQUNISU5FX0NIRUNLOiBQcm9jZXNzb3Ig
cmVwb3J0ZWQgYSBNYWNoaW5lIENoZWNrIEV4Y2VwdGlvbi4ifSwKICAgeygxIDw8IDUpLCAiVEFJ
TlRfQkFEX1BBR0U6IEJhZCBwYWdlIHJlZmVyZW5jZSBvciBhbiB1bmV4cGVjdGVkIHBhZ2UgZmxh
Z3MuIn0sCiAgIHsoMSA8PCA3KSwgIlRBSU5UX0RJRTogS2VybmVsIGhhcyBkaWVkIC0gQlVHL09P
UFMuIn0sCiAgIHsoMSA8PCA5KSwgIlRBSU5UX1dBUk46IFdBUk5fT04gaGFzIGhhcHBlbmVkLiJ9
LAotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
