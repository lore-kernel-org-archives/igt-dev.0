Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 618A96E63B
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Nov 2019 08:24:50 +0000 (UTC)
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 28 Nov 2019 08:24:42 +0000
Message-Id: <20191128082442.3779517-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/drm_import_export: Restrict runtime
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

U3dpdGNoIGZyb20gZml4ZWQgYW1vdW50IG9mIHdvcmsgdG8gZml4ZWQgdGltZSBzbyB0aGF0IHdl
IGRvbid0IGhhdmUKb3JkZXItb2YtbWFnbml0dWRlIGRpc2NyZXBhbmNpZXMgaW4gcnVudGltZSBi
ZXR3ZWVuIHBsYXRmb3Jtcy4KClNpZ25lZC1vZmYtYnk6IENocmlzIFdpbHNvbiA8Y2hyaXNAY2hy
aXMtd2lsc29uLmNvLnVrPgotLS0KIHRlc3RzL2RybV9pbXBvcnRfZXhwb3J0LmMgfCA2ICsrKy0t
LQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS90ZXN0cy9kcm1faW1wb3J0X2V4cG9ydC5jIGIvdGVzdHMvZHJtX2ltcG9ydF9leHBv
cnQuYwppbmRleCBmNzljMDlkYjguLmQ4ZjliNjA2NSAxMDA2NDQKLS0tIGEvdGVzdHMvZHJtX2lt
cG9ydF9leHBvcnQuYworKysgYi90ZXN0cy9kcm1faW1wb3J0X2V4cG9ydC5jCkBAIC00MCw2ICs0
MCw3IEBACiAjaW5jbHVkZSA8dW5pc3RkLmg+CiAjaW5jbHVkZSA8c3lzL3N5c2NhbGwuaD4KIAor
I2RlZmluZSBEVVJBVElPTiAxMAogCiBpbnQgZmQ7CiBkcm1faW50ZWxfYnVmbWdyICpidWZtZ3I7
CkBAIC0xMDcsOCArMTA4LDcgQEAgc3RhdGljIHZvaWQgc3RhcnRfdGVzdCh2b2lkKQogewogCWlu
dCBpOwogCi0JZm9yIChpPTA7IGkgPCAxNjM4NDsgaSsrKQotCXsKKwlpZ3RfdW50aWxfdGltZW91
dChEVVJBVElPTikgewogCQlkcm1faW50ZWxfYm8gKiBib19zaGFyZWQ7CiAKIAkJYm9fc2hhcmVk
ID0gZHJtX2ludGVsX2JvX2FsbG9jKGJ1Zm1ncjEsICJidWYtc2hhcmVkIiwxNjM4NCwgNDA5Nik7
CkBAIC0xOTYsNyArMTk2LDcgQEAgc3RhdGljIHZvaWQgdGVzdF9pbXBvcnRfY2xvc2VfcmFjZSh2
b2lkKQogCiAJaWd0X2Fzc2VydF9lcShwdGhyZWFkX2NyZWF0ZSgmdCwgTlVMTCwgaW1wb3J0X2Ns
b3NlX3RocmVhZCAsICZ0X2RhdGEpLCAwKTsKIAotCWlndF91bnRpbF90aW1lb3V0KDE1KSB7CisJ
aWd0X3VudGlsX3RpbWVvdXQoRFVSQVRJT04pIHsKIAkJYm8gPSBkcm1faW50ZWxfYm9fYWxsb2Mo
YnVmbWdyLCAiYnVmLXNoYXJlZCIsIDQwOTYsIDQwOTYpOwogCQlpZ3RfYXNzZXJ0KGJvICE9IE5V
TEwpOwogCQkvKgotLSAKMi4yNC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ln
dC1kZXY=
