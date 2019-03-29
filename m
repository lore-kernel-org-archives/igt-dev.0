Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F176E517
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Mar 2019 21:44:10 +0000 (UTC)
From: Caz Yokoyama <caz.yokoyama@intel.com>
Date: Fri, 29 Mar 2019 14:32:36 -0700
Message-Id: <78de952a1ca17d1be40764a0bec04a205380a96a.1553894494.git.caz.yokoyama@intel.com>
Subject: [igt-dev] [PATCH i-g-t 1/1] i915_pm_rpm: gem-execbuf-stress subtest
 faster
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

QnkgY2xlYW4gdXAgaWRsZSB3b3JrLCBnZW0tZXhlY2J1Zi1zdHJlc3Mgc3VidGVzdCBydW5zIDEu
MiBzZWMuCgpJIGRpdmlkZSAiaTkxNV9wbV9ycG06IHJlbW92ZSBnZW0tZXhlY2J1Zi1zdHJlc3Mt
ZXh0cmEtd2FpdCBiZWNhdXNlCnNhbWUgYXMgZ2VtLWV4ZWNidWYtc3RyZXNzIiBpbnRvIDIgcGF0
Y2hlcy4gVGhpcyBpcyBvbmUgb2YgdGhlbS4KCkNjOiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlz
LXdpbHNvbi5jby51az4KU2lnbmVkLW9mZi1ieTogQ2F6IFlva295YW1hIDxjYXoueW9rb3lhbWFA
aW50ZWwuY29tPgotLS0KIHRlc3RzL2k5MTUvaTkxNV9wbV9ycG0uYyB8IDUgKysrKy0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMgYi90ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMKaW5kZXgg
NzU5Yzc2ZWEuLjdlN2VmYjc0IDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2k5MTVfcG1fcnBtLmMK
KysrIGIvdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jCkBAIC0xMzM4LDggKzEzMzgsMTEgQEAgc3Rh
dGljIHZvaWQgZ2VtX2V4ZWNidWZfc3RyZXNzX3N1YnRlc3QoaW50IHJvdW5kcywgaW50IHdhaXRf
ZmxhZ3MpCiAJZm9yIChpID0gMDsgaSA8IHJvdW5kczsgaSsrKSB7CiAJCWdlbV9leGVjYnVmKGRy
bV9mZCwgJmV4ZWNidWYpOwogCi0JCWlmICh3YWl0X2ZsYWdzICYgV0FJVF9TVEFUVVMpCisJCWlm
ICh3YWl0X2ZsYWdzICYgV0FJVF9TVEFUVVMpIHsKKwkJCS8qIGNsZWFuIHVwIGlkbGUgd29yayAq
LworCQkJaWd0X2Ryb3BfY2FjaGVzX3NldChkcm1fZmQsIERST1BfSURMRSk7CiAJCQlpZ3RfYXNz
ZXJ0KHdhaXRfZm9yX3N1c3BlbmRlZCgpKTsKKwkJfQogCQlpZiAod2FpdF9mbGFncyAmIFdBSVRf
UEM4X1JFUykKIAkJCWlndF9hc3NlcnQocGM4X3BsdXNfcmVzaWRlbmN5X2NoYW5nZWQoMzApKTsK
IAkJaWYgKHdhaXRfZmxhZ3MgJiBXQUlUX0VYVFJBKQotLSAKMi4xNy4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdApp
Z3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
