Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE0C28924F
 for <igt-dev@lists.freedesktop.org>; Mon, 23 Nov 2020 09:44:28 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 23 Nov 2020 10:43:38 +0100
Message-Id: <20201123094355.39793-15-zbigniew.kempczynski@intel.com>
In-Reply-To: <20201123094355.39793-1-zbigniew.kempczynski@intel.com>
References: <20201123094355.39793-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v11 14/31] lib/igt_fb: Initialize intel_buf
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

V2UgbmVlZCB0byBoYXZlIHNhbWUgc2l6ZSB3aGVuIGludGVsX2J1ZiBpcyBpbml0aWFsaXplZCBv
dmVyIGZiCih3aXRoIGNvbXByZXNzaW9uKSBiZWNhdXNlIGFsbG9jYXRvciBjb3VsZCBiZSBjYWxs
ZWQgd2l0aCBzbWFsbGVyCnNpemUgd2hhdCBjb3VsZCBsZWFkIHRvIHJlbG9jYXRpb24uCgpVc2Ug
bmV3IGludGVsX2J1ZiBmdW5jdGlvbiB3aGljaCBhbGxvd3MgaW5pdGFsaXplIHdpdGggaGFuZGxl
IGFuZCBzaXplLgoKU2lnbmVkLW9mZi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmll
dy5rZW1wY3p5bnNraUBpbnRlbC5jb20+CkNjOiBEb21pbmlrIEdyemVnb3J6ZWsgPGRvbWluaWsu
Z3J6ZWdvcnpla0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiBsaWIvaWd0X2ZiLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rf
ZmIuYyBiL2xpYi9pZ3RfZmIuYwppbmRleCA0MjJhOWUwNi4uZjM3MWU3ZTkgMTAwNjQ0Ci0tLSBh
L2xpYi9pZ3RfZmIuYworKysgYi9saWIvaWd0X2ZiLmMKQEAgLTIxNzMsMTEgKzIxNzMsMTEgQEAg
aWd0X2ZiX2NyZWF0ZV9pbnRlbF9idWYoaW50IGZkLCBzdHJ1Y3QgYnVmX29wcyAqYm9wcywKIAli
b19uYW1lID0gZ2VtX2ZsaW5rKGZkLCBmYi0+Z2VtX2hhbmRsZSk7CiAJaGFuZGxlID0gZ2VtX29w
ZW4oZmQsIGJvX25hbWUpOwogCi0JYnVmID0gaW50ZWxfYnVmX2NyZWF0ZV91c2luZ19oYW5kbGUo
Ym9wcywgaGFuZGxlLAotCQkJCQkgICAgZmItPndpZHRoLCBmYi0+aGVpZ2h0LAotCQkJCQkgICAg
ZmItPnBsYW5lX2JwcFswXSwgMCwKLQkJCQkJICAgIGlndF9mYl9tb2RfdG9fdGlsaW5nKGZiLT5t
b2RpZmllciksCi0JCQkJCSAgICBjb21wcmVzc2lvbik7CisJYnVmID0gaW50ZWxfYnVmX2NyZWF0
ZV91c2luZ19oYW5kbGVfYW5kX3NpemUoYm9wcywgaGFuZGxlLAorCQkJCQkJICAgICBmYi0+d2lk
dGgsIGZiLT5oZWlnaHQsCisJCQkJCQkgICAgIGZiLT5wbGFuZV9icHBbMF0sIDAsCisJCQkJCQkg
ICAgIGlndF9mYl9tb2RfdG9fdGlsaW5nKGZiLT5tb2RpZmllciksCisJCQkJCQkgICAgIGNvbXBy
ZXNzaW9uLCBmYi0+c2l6ZSk7CiAJaW50ZWxfYnVmX3NldF9uYW1lKGJ1ZiwgbmFtZSk7CiAKIAkv
KiBNYWtlIHN1cmUgd2UgY2xvc2UgaGFuZGxlIG9uIGRlc3Ryb3kgcGF0aCAqLwotLSAKMi4yNi4w
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2
IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
