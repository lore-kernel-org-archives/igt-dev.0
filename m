Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8D589262
 for <igt-dev@lists.freedesktop.org>; Wed, 12 Jun 2019 22:58:52 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Wed, 12 Jun 2019 15:57:33 -0700
Message-Id: <20190612225734.14514-9-antonio.argenziano@intel.com>
In-Reply-To: <20190612225734.14514-1-antonio.argenziano@intel.com>
References: <20190612225734.14514-1-antonio.argenziano@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v5 8/9] Remove static variables from mapping
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
YS9saWIvaTkxNS9nZW1fbW1hbi5jIGIvbGliL2k5MTUvZ2VtX21tYW4uYwppbmRleCA0ZDQxYTY2
ZC4uN2I3ZmZiOTkgMTAwNjQ0Ci0tLSBhL2xpYi9pOTE1L2dlbV9tbWFuLmMKKysrIGIvbGliL2k5
MTUvZ2VtX21tYW4uYwpAQCAtNTAsMjIgKzUwLDE3IEBACiAgKi8KIHN0YXRpYyBpbnQgZ2VtX21t
YXBfX2d0dF92ZXJzaW9uKGludCBmZCkKIHsKLQlzdGF0aWMgaW50IGd0dF92ZXJzaW9uID0gfjA7
Ci0KLQlpZiAoZ3R0X3ZlcnNpb24gPT0gfjApIHsKLQkJCXN0cnVjdCBkcm1faTkxNV9nZXRwYXJh
bSBncDsKLQotCQkJZ3R0X3ZlcnNpb24gPSAwOworCWludCBndHRfdmVyc2lvbiA9IH4wOworCXN0
cnVjdCBkcm1faTkxNV9nZXRwYXJhbSBncDsKIAotCQkJbWVtc2V0KCZncCwgMCwgc2l6ZW9mKGdw
KSk7Ci0JCQlncC5wYXJhbSA9IEk5MTVfUEFSQU1fTU1BUF9HVFRfVkVSU0lPTjsKLQkJCWdwLnZh
bHVlID0gJmd0dF92ZXJzaW9uOworCW1lbXNldCgmZ3AsIDAsIHNpemVvZihncCkpOworCWdwLnBh
cmFtID0gSTkxNV9QQVJBTV9NTUFQX0dUVF9WRVJTSU9OOworCWdwLnZhbHVlID0gJmd0dF92ZXJz
aW9uOwogCi0JCQlpZihpb2N0bChmZCwgRFJNX0lPQ1RMX0k5MTVfR0VUUEFSQU0sICZncCkgJiYg
ZXJybm8gPT0gLUVOT0RFVikKLQkJCQlndHRfdmVyc2lvbiA9IC0xOyAvKiBObyBtYXBwYWJsZSBh
cGVydHVyZSAqLworCWlmKGlvY3RsKGZkLCBEUk1fSU9DVExfSTkxNV9HRVRQQVJBTSwgJmdwKSAm
JiBlcnJubyA9PSAtRU5PREVWKQorCQlndHRfdmVyc2lvbiA9IC0xOyAvKiBObyBtYXBwYWJsZSBh
cGVydHVyZSAqLwogCi0JCQllcnJubyA9IDA7Ci0JfQorCWVycm5vID0gMDsKIAogCXJldHVybiBn
dHRfdmVyc2lvbjsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2
