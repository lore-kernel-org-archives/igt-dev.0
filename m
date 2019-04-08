Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B0A28928D
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Apr 2019 15:49:04 +0000 (UTC)
From: Ramalingam C <ramalingam.c@intel.com>
Date: Mon,  8 Apr 2019 21:20:38 +0530
Message-Id: <20190408155038.2389-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/i915/gem_mmap: test for non
 pagealingned mmaps
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
To: igt-dev@lists.freedesktop.org, tvrtko.ursulin@linux.intel.com
List-ID: <igt-dev@lists.freedesktop.org>

S2VybmVsIHN1cHBvcnRzIHRoZSBub24gcGFnZSBhbGlnbmVkIG1tYXBzLiBIZW5jZSB0aGlzIG5l
dyBzdWJ0ZXN0CmhlbHBzIHRvIG1haW50YWluIHRoZSBzYW5pdHkgb2Ygc3VjaCBzdXBwb3J0LgoK
U2lnbmVkLW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgotLS0K
IHRlc3RzL2k5MTUvZ2VtX21tYXAuYyB8IDE1ICsrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5n
ZWQsIDE1IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS90ZXN0cy9pOTE1L2dlbV9tbWFwLmMg
Yi90ZXN0cy9pOTE1L2dlbV9tbWFwLmMKaW5kZXggMWY1MzQ4ZDkxMzNiLi5mNjZkOGI4OTYyNjgg
MTAwNjQ0Ci0tLSBhL3Rlc3RzL2k5MTUvZ2VtX21tYXAuYworKysgYi90ZXN0cy9pOTE1L2dlbV9t
bWFwLmMKQEAgLTIyOCw2ICsyMjgsMjEgQEAgaWd0X21haW4KIAkJfQogCX0KIAorCWlndF9zdWJ0
ZXN0KCJwYWdlX25vbmFsaWduZWQiKSB7CisJCXN0cnVjdCBkcm1faTkxNV9nZW1fbW1hcCBhcmcg
PSB7CisJCQkuaGFuZGxlID0gZ2VtX2NyZWF0ZShmZCwgUEFHRV9TSVpFKSwKKwkJCS5zaXplID0g
UEFHRV9TSVpFIC0gNSwKKwkJCS5mbGFncyA9IEk5MTVfTU1BUF9XQywKKwkJfTsKKworCQlpZ3Rf
ZGVidWcoIlRyeWluZyB0byBtbWFwIHBhZ2Ugbm9uYWxpZ25lZCBzaXplIDogJSciUFJJdTY0Ilxu
IiwKKwkJCSAgKHVuc2lnbmVkIGxvbmcpYXJnLnNpemUpOworCQlpZ3RfYXNzZXJ0X2VxKG1tYXBf
aW9jdGwoZmQsICZhcmcpLCAwKTsKKworCQlnZW1fY2xvc2UoZmQsIGFyZy5oYW5kbGUpOworCQlt
dW5tYXAoZnJvbV91c2VyX3BvaW50ZXIoYXJnLmFkZHJfcHRyKSwgUEFHRV9TSVpFIC0gNSk7CisJ
fQorCiAJaWd0X3N1YnRlc3QoImJhc2ljIikgewogCQlzdHJ1Y3QgZHJtX2k5MTVfZ2VtX21tYXAg
YXJnID0gewogCQkJLmhhbmRsZSA9IGdlbV9jcmVhdGUoZmQsIE9CSkVDVF9TSVpFKSwKLS0gCjIu
MTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0
LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2
