Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48B7B6EBEC
 for <igt-dev@lists.freedesktop.org>; Wed,  9 May 2018 00:49:01 +0000 (UTC)
From: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
Date: Tue,  8 May 2018 17:48:55 -0700
Message-Id: <20180509004855.4121-1-dhinakaran.pandiyan@intel.com>
Subject: [igt-dev] [PATCH i-g-t] tools/vbt_decode: Print DRRS and PSR flags
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VGhlc2UgYml0cyBhcmUgdXNlZnVsIGZvciBkZWJ1Zy4KCkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJp
Z28udml2aUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IERoaW5ha2FyYW4gUGFuZGl5YW4gPGRo
aW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgotLS0KIHRvb2xzL2ludGVsX3ZidF9kZWNvZGUu
YyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90
b29scy9pbnRlbF92YnRfZGVjb2RlLmMgYi90b29scy9pbnRlbF92YnRfZGVjb2RlLmMKaW5kZXgg
ZDdjYmM0MzYuLmU2MWYwYThjIDEwMDY0NAotLS0gYS90b29scy9pbnRlbF92YnRfZGVjb2RlLmMK
KysrIGIvdG9vbHMvaW50ZWxfdmJ0X2RlY29kZS5jCkBAIC03MjEsNiArNzIxLDggQEAgc3RhdGlj
IHZvaWQgZHVtcF9kcml2ZXJfZmVhdHVyZShzdHJ1Y3QgY29udGV4dCAqY29udGV4dCwKIAlwcmlu
dGYoIlx0TGVnYWN5IENSVCBtYXggWTogJWRcbiIsIGZlYXR1cmUtPmxlZ2FjeV9jcnRfbWF4X3kp
OwogCXByaW50ZigiXHRMZWdhY3kgQ1JUIG1heCByZWZyZXNoOiAlZFxuIiwKIAkgICAgICAgZmVh
dHVyZS0+bGVnYWN5X2NydF9tYXhfcmVmcmVzaCk7CisJcHJpbnRmKCJcdEVuYWJsZSBEUlJTOiAl
c1xuIiwgWUVTTk8oZmVhdHVyZS0+ZHJyc19lbmFibGVkKSk7CisJcHJpbnRmKCJcdEVuYWJsZSBQ
U1I6ICVzXG4iLCBZRVNOTyhmZWF0dXJlLT5wc3JfZW5hYmxlZCkpOwogfQogCiBzdGF0aWMgdm9p
ZCBkdW1wX2VkcChzdHJ1Y3QgY29udGV4dCAqY29udGV4dCwKLS0gCjIuMTQuMQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxp
c3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==
