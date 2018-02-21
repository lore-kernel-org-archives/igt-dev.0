Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C0E6EAC0
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Feb 2018 23:20:41 +0000 (UTC)
From: Jordan Justen <jordan.l.justen@intel.com>
Date: Wed, 21 Feb 2018 15:19:04 -0800
Message-Id: <20180221231905.15580-5-jordan.l.justen@intel.com>
In-Reply-To: <20180221231905.15580-1-jordan.l.justen@intel.com>
References: <20180221231905.15580-1-jordan.l.justen@intel.com>
Subject: [igt-dev] [PATCH i-g-t 5/6] aubdump: Note pinned BO in verbose
 output
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: IGT GPU Tools <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogSm9yZGFuIEp1c3RlbiA8am9yZGFuLmwuanVzdGVuQGludGVsLmNvbT4K
LS0tCiB0b29scy9hdWJkdW1wLmMgfCA5ICsrKysrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90b29scy9hdWJkdW1wLmMg
Yi90b29scy9hdWJkdW1wLmMKaW5kZXggYWVhMTA5NzAuLjRlY2JhMDFhIDEwMDY0NAotLS0gYS90
b29scy9hdWJkdW1wLmMKKysrIGIvdG9vbHMvYXViZHVtcC5jCkBAIC05MzYsMTUgKzkzNiwxOCBA
QCBkdW1wX2V4ZWNidWZmZXIyKGludCBmZCwgc3RydWN0IGRybV9pOTE1X2dlbV9leGVjYnVmZmVy
MiAqZXhlY2J1ZmZlcjIpCiAJCQlyZXR1cm47CiAJCX0KIAotCQlpZiAodmVyYm9zZSkKLQkJCXBy
aW50ZigiQk8gIyVkICglZEIpIEAgMHgleFxuIiwgb2JqLT5oYW5kbGUsIGJvLT5zaXplLCBvZmZz
ZXQpOwotCiAJCWlmIChvYmotPmZsYWdzICYgRVhFQ19PQkpFQ1RfUElOTkVEKSB7CiAJCQliby0+
b2Zmc2V0ID0gb2JqLT5vZmZzZXQ7CisJCQlpZiAodmVyYm9zZSkKKwkJCQlwcmludGYoIkJPICMl
ZCAoJWRCKSBwaW5uZWQgQCAweCVseFxuIiwKKwkJCQkgICAgICAgb2JqLT5oYW5kbGUsIGJvLT5z
aXplLCBiby0+b2Zmc2V0KTsKIAkJfSBlbHNlIHsKIAkJCWlmIChvYmotPmFsaWdubWVudCAhPSAw
KQogCQkJCW9mZnNldCA9IGFsaWduX3UzMihvZmZzZXQsIG9iai0+YWxpZ25tZW50KTsKIAkJCWJv
LT5vZmZzZXQgPSBvZmZzZXQ7CisJCQlpZiAodmVyYm9zZSkKKwkJCQlwcmludGYoIkJPICMlZCAo
JWRCKSBAIDB4JWx4XG4iLCBvYmotPmhhbmRsZSwKKwkJCQkgICAgICAgYm8tPnNpemUsIGJvLT5v
ZmZzZXQpOwogCQkJb2Zmc2V0ID0gYWxpZ25fdTMyKG9mZnNldCArIGJvLT5zaXplICsgNDA5NSwg
NDA5Nik7CiAJCX0KIAotLSAKMi4xNi4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXYK
