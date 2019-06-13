Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0522A8932A
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Jun 2019 21:55:39 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Thu, 13 Jun 2019 14:54:47 -0700
Message-Id: <20190613215448.17994-9-antonio.argenziano@intel.com>
In-Reply-To: <20190613215448.17994-1-antonio.argenziano@intel.com>
References: <20190613215448.17994-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v6 8/9] Remove static variables from mapping
 version function
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

LS0tCiBsaWIvaTkxNS9nZW1fbW1hbi5jIHwgMjEgKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9saWIvaTkxNS9nZW1fbW1hbi5jIGIvbGliL2k5MTUvZ2VtX21tYW4uYwppbmRleCAyYjM5NDdk
ZS4uNGQwOGEwMWUgMTAwNjQ0Ci0tLSBhL2xpYi9pOTE1L2dlbV9tbWFuLmMKKysrIGIvbGliL2k5
MTUvZ2VtX21tYW4uYwpAQCAtNTAsMjIgKzUwLDE3IEBACiAgKi8KIHN0YXRpYyBpbnQgZ2VtX21t
YXBfX2d0dF92ZXJzaW9uKGludCBmZCkKIHsKLQlzdGF0aWMgaW50IGd0dF92ZXJzaW9uID0gfjA7
CisJaW50IGd0dF92ZXJzaW9uID0gfjA7CisJc3RydWN0IGRybV9pOTE1X2dldHBhcmFtIGdwOwog
Ci0JaWYgKGd0dF92ZXJzaW9uID09IH4wKSB7Ci0JCQlzdHJ1Y3QgZHJtX2k5MTVfZ2V0cGFyYW0g
Z3A7CisJbWVtc2V0KCZncCwgMCwgc2l6ZW9mKGdwKSk7CisJZ3AucGFyYW0gPSBJOTE1X1BBUkFN
X01NQVBfR1RUX1ZFUlNJT047CisJZ3AudmFsdWUgPSAmZ3R0X3ZlcnNpb247CiAKLQkJCWd0dF92
ZXJzaW9uID0gMDsKKwlpZihpb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VUUEFSQU0sICZncCkg
JiYgZXJybm8gPT0gLUVOT0RFVikKKwkJZ3R0X3ZlcnNpb24gPSAtMTsgLyogTm8gbWFwcGFibGUg
YXBlcnR1cmUgKi8KIAotCQkJbWVtc2V0KCZncCwgMCwgc2l6ZW9mKGdwKSk7Ci0JCQlncC5wYXJh
bSA9IEk5MTVfUEFSQU1fTU1BUF9HVFRfVkVSU0lPTjsKLQkJCWdwLnZhbHVlID0gJmd0dF92ZXJz
aW9uOwotCi0JCQlpZihpb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VUUEFSQU0sICZncCkgJiYg
ZXJybm8gPT0gLUVOT0RFVikKLQkJCQlndHRfdmVyc2lvbiA9IC0xOyAvKiBObyBtYXBwYWJsZSBh
cGVydHVyZSAqLwotCi0JCQllcnJubyA9IDA7Ci0JfQorCWVycm5vID0gMDsKIAogCXJldHVybiBn
dHRfdmVyc2lvbjsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
