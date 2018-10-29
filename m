Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816E56E0CF
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Oct 2018 19:37:37 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Mon, 29 Oct 2018 19:37:29 +0000
Message-Id: <20181029193729.13788-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] igt/gem_ppgtt: Unroll 32b memset
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

TWFudWFsbHkgdW5yb2xsIHRoZSAzMmIgbWVtc2V0IGluIGNyZWF0ZV9ibygpIHRvIHNldCBhIGNh
Y2hlbGluZSBhdCBhCnRpbWUsIGZvciBhIDJ4IHNwZWVkIGltcHJvdmUgb2YgdGhlIHdob2xlIHRl
c3QuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KLS0tCiB0ZXN0cy9pOTE1L2dlbV9wcGd0dC5jIHwgMTAgKysrKysrKy0tLQogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0
cy9pOTE1L2dlbV9wcGd0dC5jIGIvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwppbmRleCBhZjVlM2Uw
Ny4uODZmZTU5ZjIgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMKKysrIGIvdGVz
dHMvaTkxNS9nZW1fcHBndHQuYwpAQCAtNDcsMTYgKzQ3LDIwIEBACiBzdGF0aWMgZHJtX2ludGVs
X2JvICpjcmVhdGVfYm8oZHJtX2ludGVsX2J1Zm1nciAqYnVmbWdyLAogCQkJICAgICAgIHVpbnQz
Ml90IHBpeGVsKQogeworCXVpbnQ2NF90IHZhbHVlID0gKHVpbnQ2NF90KXBpeGVsIDw8IDMyIHwg
cGl4ZWwsICp2OwogCWRybV9pbnRlbF9ibyAqYm87Ci0JdWludDMyX3QgKnY7CiAKIAlibyA9IGRy
bV9pbnRlbF9ib19hbGxvYyhidWZtZ3IsICJzdXJmYWNlIiwgU0laRSwgNDA5Nik7CiAJaWd0X2Fz
c2VydChibyk7CiAKIAlkb19vcl9kaWUoZHJtX2ludGVsX2JvX21hcChibywgMSkpOwogCXYgPSBi
by0+dmlydHVhbDsKLQlmb3IgKGludCBpID0gMDsgaSA8IFNJWkUvNDsgaSsrKQotCQl2W2ldID0g
cGl4ZWw7CisJZm9yIChpbnQgaSA9IDA7IGkgPCBTSVpFIC8gc2l6ZW9mKHZhbHVlKTsgaSArPSA4
KSB7CisJCXZbaSArIDBdID0gdmFsdWU7IHZbaSArIDFdID0gdmFsdWU7CisJCXZbaSArIDJdID0g
dmFsdWU7IHZbaSArIDNdID0gdmFsdWU7CisJCXZbaSArIDRdID0gdmFsdWU7IHZbaSArIDVdID0g
dmFsdWU7CisJCXZbaSArIDZdID0gdmFsdWU7IHZbaSArIDddID0gdmFsdWU7CisJfQogCWRybV9p
bnRlbF9ib191bm1hcChibyk7CiAKIAlyZXR1cm4gYm87Ci0tIAoyLjE5LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
