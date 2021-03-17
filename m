Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A957C6E5C6
 for <igt-dev@lists.freedesktop.org>; Wed, 17 Mar 2021 14:47:00 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Wed, 17 Mar 2021 15:45:53 +0100
Message-Id: <20210317144610.108372-19-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210317144610.108372-1-zbigniew.kempczynski@intel.com>
References: <20210317144610.108372-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v26 18/35] lib/igt_fb: Initialize intel_buf
 with same size as fb
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

V2UgbmVlZCB0byBoYXZlIHNhbWUgc2l6ZSB3aGVuIGludGVsX2J1ZiBpcyBpbml0aWFsaXplZCBv
dmVyIGZiCih3aXRoIGNvbXByZXNzaW9uKSBiZWNhdXNlIGFsbG9jYXRvciBjb3VsZCBiZSBjYWxs
ZWQgd2l0aCBzbWFsbGVyCnNpemUgd2hhdCBjb3VsZCBsZWFkIHRvIHJlbG9jYXRpb24uCgpVc2Ug
bmV3IGludGVsX2J1ZiBmdW5jdGlvbiB3aGljaCBhbGxvd3MgaW5pdGlhbGl6ZSB3aXRoIGhhbmRs
ZSBhbmQgc2l6ZS4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8emJpZ25p
ZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogRG9taW5payBHcnplZ29yemVrIDxkb21pbmlr
LmdyemVnb3J6ZWtAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxz
b24uY28udWs+Ci0tLQogbGliL2lndF9mYi5jIHwgMTAgKysrKystLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0
X2ZiLmMgYi9saWIvaWd0X2ZiLmMKaW5kZXggZjBmY2QxYTdmLi4yNTk0NDlkNjAgMTAwNjQ0Ci0t
LSBhL2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTIxOTcsMTEgKzIxOTcsMTEg
QEAgaWd0X2ZiX2NyZWF0ZV9pbnRlbF9idWYoaW50IGZkLCBzdHJ1Y3QgYnVmX29wcyAqYm9wcywK
IAlib19uYW1lID0gZ2VtX2ZsaW5rKGZkLCBmYi0+Z2VtX2hhbmRsZSk7CiAJaGFuZGxlID0gZ2Vt
X29wZW4oZmQsIGJvX25hbWUpOwogCi0JYnVmID0gaW50ZWxfYnVmX2NyZWF0ZV91c2luZ19oYW5k
bGUoYm9wcywgaGFuZGxlLAotCQkJCQkgICAgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAotCQkJCQkg
ICAgZmItPnBsYW5lX2JwcFswXSwgMCwKLQkJCQkJICAgIGlndF9mYl9tb2RfdG9fdGlsaW5nKGZi
LT5tb2RpZmllciksCi0JCQkJCSAgICBjb21wcmVzc2lvbik7CisJYnVmID0gaW50ZWxfYnVmX2Ny
ZWF0ZV91c2luZ19oYW5kbGVfYW5kX3NpemUoYm9wcywgaGFuZGxlLAorCQkJCQkJICAgICBmYi0+
d2lkdGgsIGZiLT5oZWlnaHQsCisJCQkJCQkgICAgIGZiLT5wbGFuZV9icHBbMF0sIDAsCisJCQkJ
CQkgICAgIGlndF9mYl9tb2RfdG9fdGlsaW5nKGZiLT5tb2RpZmllciksCisJCQkJCQkgICAgIGNv
bXByZXNzaW9uLCBmYi0+c2l6ZSk7CiAJaW50ZWxfYnVmX3NldF9uYW1lKGJ1ZiwgbmFtZSk7CiAK
IAkvKiBNYWtlIHN1cmUgd2UgY2xvc2UgaGFuZGxlIG9uIGRlc3Ryb3kgcGF0aCAqLwotLSAKMi4y
Ni4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
