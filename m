Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C58146E097
 for <igt-dev@lists.freedesktop.org>; Tue, 30 Oct 2018 11:26:49 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Tue, 30 Oct 2018 12:26:46 +0100
Message-Id: <20181030112646.14957-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_draw: Only skip when width/x is not
 a multiple of 2.
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

WSBhbmQgaGVpZ2h0IGhhdmUgbm8gc3VjaCByZXN0cmljdGlvbnMsIHNpbmNlIHBpeGVsIHNpemUg
aGFzIG5vCnJlbGF0aW9uIHRvIGhlaWdodC4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hv
cnN0IDxtYWFydGVuLmxhbmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogbGliL2lndF9kcmF3
LmMgfCA0ICstLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2RyYXcuYyBiL2xpYi9pZ3RfZHJhdy5jCmluZGV4IDA1
ODIxNDgwYmM4MC4uODRkZDIxMmMxZGFmIDEwMDY0NAotLS0gYS9saWIvaWd0X2RyYXcuYworKysg
Yi9saWIvaWd0X2RyYXcuYwpAQCAtNTgxLDkgKzU4MSw3IEBAIHN0YXRpYyB2b2lkIGRyYXdfcmVj
dF9yZW5kZXIoaW50IGZkLCBzdHJ1Y3QgY21kX2RhdGEgKmNtZF9kYXRhLAogCSAqIHNtYWxsZXIg
YnBwcyB5b3Ugd29uJ3Qgc3VjY2VlZWQgaWYgeW91IG5lZWQgdG8gY29weSAiaGFsZiIgb2YgYSAz
MmJwcAogCSAqIHBpeGVsIG9yIHNvbWV0aGluZyBzaW1pbGFyLiAqLwogCWlndF9za2lwX29uKHJl
Y3QtPnggJSAoMzIgLyBidWYtPmJwcCkgIT0gMCB8fAotCQkgICAgcmVjdC0+eSAlICgzMiAvIGJ1
Zi0+YnBwKSAhPSAwIHx8Ci0JCSAgICByZWN0LT53ICUgKDMyIC8gYnVmLT5icHApICE9IDAgfHwK
LQkJICAgIHJlY3QtPmggJSAoMzIgLyBidWYtPmJwcCkgIT0gMCk7CisJCSAgICByZWN0LT53ICUg
KDMyIC8gYnVmLT5icHApICE9IDApOwogCiAJaWd0X3JlcXVpcmUoZ2VtX2dldF90aWxpbmcoZmQs
IGJ1Zi0+aGFuZGxlLCAmdGlsaW5nLCAmc3dpenpsZSkpOwogCi0tIAoyLjE5LjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBs
aXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
