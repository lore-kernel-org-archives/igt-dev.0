Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B6136E119
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Jan 2020 19:00:33 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu, 23 Jan 2020 11:00:29 -0800
Message-Id: <20200123190029.19882-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_psr2_su: Print the SU blocks
 mismatches
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

VGhpcyB3aWxsIGhlbHAgdXMgZGVidWcgZmFpbHVyZXMgaW4gdGhpcyB0ZXN0LgoKU2lnbmVkLW9m
Zi1ieTogSm9zw6kgUm9iZXJ0byBkZSBTb3V6YSA8am9zZS5zb3V6YUBpbnRlbC5jb20+Ci0tLQog
dGVzdHMva21zX3BzcjJfc3UuYyB8IDcgKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfcHNyMl9zdS5j
IGIvdGVzdHMva21zX3BzcjJfc3UuYwppbmRleCBmMjI0NGIyOS4uOWY0MGM3MzUgMTAwNjQ0Ci0t
LSBhL3Rlc3RzL2ttc19wc3IyX3N1LmMKKysrIGIvdGVzdHMva21zX3BzcjJfc3UuYwpAQCAtMTgz
LDkgKzE4MywxMyBAQCBzdGF0aWMgYm9vbCB1cGRhdGVfc2NyZWVuX2FuZF90ZXN0KGRhdGFfdCAq
ZGF0YSkKIAkJaWd0X2Fzc2VydF9mKGRhdGEtPm9wLCAiT3BlcmF0aW9uIG5vdCBoYW5kbGVkXG4i
KTsKIAl9CiAKLQlpZiAocHNyMl93YWl0X3N1KGRhdGEtPmRlYnVnZnNfZmQsICZzdV9ibG9ja3Mp
KQorCWlmIChwc3IyX3dhaXRfc3UoZGF0YS0+ZGVidWdmc19mZCwgJnN1X2Jsb2NrcykpIHsKIAkJ
cmV0ID0gc3VfYmxvY2tzID09IEVYUEVDVEVEX05VTV9TVV9CTE9DS1M7CiAKKwkJaWYgKCFyZXQp
CisJCQlpZ3RfZGVidWcoIk5vdCBtYXRjaGluZyBTVSBibG9ja3MgcmVhZDogJXVcbiIsIHN1X2Js
b2Nrcyk7CisJfQorCiAJcmV0dXJuIHJldDsKIH0KIApAQCAtMjA2LDcgKzIxMCw2IEBAIHN0YXRp
YyB2b2lkIHJ1bihkYXRhX3QgKmRhdGEpCiAJCQlyZXN1bHQgPSB1cGRhdGVfc2NyZWVuX2FuZF90
ZXN0KGRhdGEpOwogCX0KIAotCWlndF9kZWJ1ZygiU2NyZWVuIGNoYW5nZXM6ICV1XG4iLCBkYXRh
LT5zY3JlZW5fY2hhbmdlcyk7CiAJaWd0X2Fzc2VydF9mKHJlc3VsdCwKIAkJICAgICAiTm8gbWF0
Y2hpbmcgc2VsZWN0aXZlIHVwZGF0ZSBibG9ja3MgcmVhZCBmcm9tIGRlYnVnZnNcbiIpOwogfQot
LSAKMi4yNS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
