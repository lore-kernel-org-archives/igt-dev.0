Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1226EBAD
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Mar 2018 11:47:28 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri,  9 Mar 2018 11:47:19 +0000
Message-Id: <20180309114719.15327-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt] overlay: Remove the miscalculation of window
 position
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
To: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

V2UgYWxyZWFkeSBjYWxsIHgxMV9wb3NpdGlvbigpIHRvIGNhbGN1bGF0ZSB0aGUgcG9zaXRpb24g
b2YgdGhlCm92ZXJsYXksIHNvIGRvIG5vdCBuZWVkIHRvIG1hbnVhbGx5IHJlY29tcHV0ZSB0aGVt
IGluc2lkZQp4MTFfb3ZlcmxheV9jcmVhdGUoKS4gVGhpcyBoYXMgdGhlIGFkdmFudGFnZSB0aGF0
IHgxMV9wb3NpdGlvbigpCnVuZGVyc3RhbmRzIHRoZSBtdWx0aS1tb25pdG9yIGxheW91dCBpbnN0
cnVjdGlvbnMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNv
bi5jby51az4KLS0tCiBvdmVybGF5L3gxMS94MTEtb3ZlcmxheS5jIHwgMTYgLS0tLS0tLS0tLS0t
LS0tLQogMSBmaWxlIGNoYW5nZWQsIDE2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL292ZXJs
YXkveDExL3gxMS1vdmVybGF5LmMgYi9vdmVybGF5L3gxMS94MTEtb3ZlcmxheS5jCmluZGV4IGQw
OGViZmM5Li5hZTY0OTQyOSAxMDA2NDQKLS0tIGEvb3ZlcmxheS94MTEveDExLW92ZXJsYXkuYwor
KysgYi9vdmVybGF5L3gxMS94MTEtb3ZlcmxheS5jCkBAIC0yNzEsMjIgKzI3MSw2IEBAIHgxMV9v
dmVybGF5X2NyZWF0ZShzdHJ1Y3QgY29uZmlnICpjb25maWcsIGludCAqd2lkdGgsIGludCAqaGVp
Z2h0KQogCiAJcHJpdi0+eCA9IHg7CiAJcHJpdi0+eSA9IHk7Ci0JaWYgKHBvc2l0aW9uICE9IFBP
U19VTlNFVCkgewotCQlzd2l0Y2ggKHBvc2l0aW9uICYgNykgewotCQlkZWZhdWx0OgotCQljYXNl
IDA6IHByaXYtPnggPSAwOyBicmVhazsKLQkJY2FzZSAxOiBwcml2LT54ID0gKHNjci0+d2lkdGgg
LSBpbWFnZS0+d2lkdGgpLzI7IGJyZWFrOwotCQljYXNlIDI6IHByaXYtPnggPSBzY3ItPndpZHRo
IC0gaW1hZ2UtPndpZHRoOyBicmVhazsKLQkJfQotCi0JCXN3aXRjaCAoKHBvc2l0aW9uID4+IDQp
ICYgNykgewotCQlkZWZhdWx0OgotCQljYXNlIDA6IHByaXYtPnkgPSAwOyBicmVhazsKLQkJY2Fz
ZSAxOiBwcml2LT55ID0gKHNjci0+aGVpZ2h0IC0gaW1hZ2UtPmhlaWdodCkvMjsgYnJlYWs7Ci0J
CWNhc2UgMjogcHJpdi0+eSA9IHNjci0+aGVpZ2h0IC0gaW1hZ2UtPmhlaWdodDsgYnJlYWs7Ci0J
CX0KLQl9Ci0KIAogCXByaXYtPmltYWdlID0gaW1hZ2U7CiAJcHJpdi0+aW1hZ2UtPmRhdGEgPSAo
dm9pZCAqKSZwcml2LT5uYW1lOwotLSAKMi4xNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2lndC1kZXYK
