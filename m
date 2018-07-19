Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF92F6ED3E
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Jul 2018 15:04:34 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Thu, 19 Jul 2018 18:03:55 +0300
Message-Id: <20180719150415.935-5-ville.syrjala@linux.intel.com>
In-Reply-To: <20180719150415.935-1-ville.syrjala@linux.intel.com>
References: <20180719150415.935-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 05/25] tests/gem_render_copy: Fix clipped
 height
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFz
c2lnbiB0aGUgY2xpcHBlZCBoZWlnaHQgdG8gJ2gnLCBub3QgJ3cnLiBUaGlzIGRpZG4ndCBjYXVz
ZSBhbnkKcHJvYmxlbXMgc28gZmFyIGJlY2F1c2Ugd2UgdXNlIHNxdWFyZSBidWZmZXJzLgoKQWxz
byBnZXQgcmlkIG9mIHRoZSBnY2MgdmFyaWFibGUgc2hhZG93aW5nIHdhcm5pbmdzIGJ5IG5vdCBu
ZXN0aW5nIHRoZQptaW4oKS9tYXgoKS4KCkZpeGVzOiBhYWEyM2VmZjIxYTEgKCJ0ZXN0cy9nZW1f
cmVuZGVyX2NvcHk6IFVzZSBhIG1vcmUgZWxhYm9yYXRlIHBhdHRlcm4gb2YgcGl4ZWxzIikKU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KLS0tCiB0ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5n
ZWQsIDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9n
ZW1fcmVuZGVyX2NvcHkuYyBiL3Rlc3RzL2dlbV9yZW5kZXJfY29weS5jCmluZGV4IDIzOGU3MGU5
N2I1ZC4uMTM1Mzc1YTkwZWMyIDEwMDY0NAotLS0gYS90ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYwor
KysgYi90ZXN0cy9nZW1fcmVuZGVyX2NvcHkuYwpAQCAtMjU0LDggKzI1NCwxMSBAQCBzY3JhdGNo
X2J1Zl9jb3B5KGRhdGFfdCAqZGF0YSwKIAlsaW5lYXJfc3JjID0gZ2VtX21tYXBfX2d0dChkYXRh
LT5kcm1fZmQsIHNyYy0+Ym8tPmhhbmRsZSwKIAkJCQkgICBzcmMtPmJvLT5zaXplLCBQUk9UX1JF
QUQpOwogCi0JdyA9IG1pbih3LCBtaW4od2lkdGggLSBzeCwgd2lkdGggLSBkeCkpOwotCXcgPSBt
aW4oaCwgbWluKGhlaWdodCAtIHN5LCBoZWlnaHQgLSBkeSkpOworCXcgPSBtaW4odywgd2lkdGgg
LSBzeCk7CisJdyA9IG1pbih3LCB3aWR0aCAtIGR4KTsKKworCWggPSBtaW4oaCwgaGVpZ2h0IC0g
c3kpOworCWggPSBtaW4oaCwgaGVpZ2h0IC0gZHkpOwogCiAJZm9yIChpbnQgeSA9IDA7IHkgPCBo
OyB5KyspIHsKIAkJaWd0X21lbWNweV9mcm9tX3djKCZsaW5lYXJfZHN0WyhkeSt5KSAqIHdpZHRo
ICsgZHhdLAotLSAKMi4xNi40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1k
ZXYK
