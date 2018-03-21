Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51656E8E5
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Mar 2018 11:09:52 +0000 (UTC)
From: Daniel Stone <daniels@collabora.com>
Date: Wed, 21 Mar 2018 11:09:48 +0000
Message-Id: <20180321110948.11816-1-daniels@collabora.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib: Don't fail if plane IN_FORMATS not
 present
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

aWd0X2Rpc3BsYXlfaW5pdCgpIG5vdyB1bmNvbmRpdGlvbmFsbHkgdHJpZXMgdG8gZ2V0IHRoZSBw
bGFuZSBJTl9GT1JNQVRTCmJsb2IsIHdoaWNoIGNhdXNlcyBhIGhhcmQgYXNzZXJ0IGZhaWx1cmUg
aWYgd2UgZG9uJ3QgaGF2ZSB0aGUgcHJvcGVydHkKcHJlc2VudC4KCkNoZWNrIGlmIGl0J3MgdGhl
cmUgYW5kIHJldHVybiBlYXJseSBpZiBub3QuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgU3RvbmUg
PGRhbmllbHNAY29sbGFib3JhLmNvbT4KRml4ZXM6IDk4Zjc2MTRiZDcyNSAoImxpYjogUGFyc2Ug
cGxhbmUgSU5fRk9STUFUUyBibG9iaWZpZXJzIGludG8gYSBuaWNlciBmb3JtIikKQ2M6IFZpbGxl
IFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxz
b24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMyArKysK
IDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2tt
cy5jIGIvbGliL2lndF9rbXMuYwppbmRleCA3MjIyNjQyZS4uOTMyNDA0MjcgMTAwNjQ0Ci0tLSBh
L2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMzk1Nyw2ICszOTU3LDkgQEAg
c3RhdGljIHZvaWQgaWd0X2ZpbGxfcGxhbmVfZm9ybWF0X21vZChpZ3RfZGlzcGxheV90ICpkaXNw
bGF5LCBpZ3RfcGxhbmVfdCAqcGxhbmUKIAlpbnQgaWR4ID0gMDsKIAlpbnQgY291bnQ7CiAKKwlp
ZiAoIWlndF9wbGFuZV9oYXNfcHJvcChwbGFuZSwgSUdUX1BMQU5FX0lOX0ZPUk1BVFMpKQorCQly
ZXR1cm47CisKIAlibG9iX2lkID0gaWd0X3BsYW5lX2dldF9wcm9wKHBsYW5lLCBJR1RfUExBTkVf
SU5fRk9STUFUUyk7CiAKIAlibG9iID0gZHJtTW9kZUdldFByb3BlcnR5QmxvYihkaXNwbGF5LT5k
cm1fZmQsIGJsb2JfaWQpOwotLSAKMi4xNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
