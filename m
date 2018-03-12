Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 308CC6E0E7
 for <igt-dev@lists.freedesktop.org>; Mon, 12 Mar 2018 17:30:18 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 12 Mar 2018 18:30:11 +0100
Message-Id: <20180312173013.50903-4-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180312173013.50903-1-maarten.lankhorst@linux.intel.com>
References: <20180312173013.50903-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 3/5] tests/kms_frontbuffer_tracking: Fix
 basic subtest
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

V2hlbiBydW5uaW5nIHRoZSBlbnRpcmUgYmluYXJ5LCB3ZSBoYXZlIHRvdWNoZWQgZmVhdHVyZXMg
YmVmb3JlIHJ1bm5pbmcKdGhlIGJhc2ljIHN1YnRlc3QuIFJlc3RvcmUgdGhlbSBiYWNrIHRvIHRo
ZSBkZWZhdWx0cy4KClNpZ25lZC1vZmYtYnk6IE1hYXJ0ZW4gTGFua2hvcnN0IDxtYWFydGVuLmxh
bmtob3JzdEBsaW51eC5pbnRlbC5jb20+Ci0tLQogdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNr
aW5nLmMgfCA5ICsrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
YyBiL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90cmFja2luZy5jCmluZGV4IDc0NmY4ZDFmOGE3NS4u
MDAwZjU0ZWVmNDA4IDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
YworKysgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwpAQCAtMTIxOCw5ICsxMjE4
LDYgQEAgc3RhdGljIHZvaWQgdW5zZXRfYWxsX2NydGNzKHZvaWQpCiAKIHN0YXRpYyB2b2lkIGRp
c2FibGVfZmVhdHVyZXMoY29uc3Qgc3RydWN0IHRlc3RfbW9kZSAqdCkKIHsKLQlpZiAodC0+ZmVh
dHVyZSA9PSBGRUFUVVJFX0RFRkFVTFQpCi0JCXJldHVybjsKLQogCWZiY19zZXQoMCk7CiAJcHNy
X3NldCgwKTsKIAlkcnJzX3NldCgwKTsKQEAgLTE4NDksOCArMTg0NiwxMiBAQCBzdGF0aWMgdm9p
ZCBzZXRfcmVnaW9uX2Zvcl90ZXN0KGNvbnN0IHN0cnVjdCB0ZXN0X21vZGUgKnQsCiAKIHN0YXRp
YyB2b2lkIGVuYWJsZV9mZWF0dXJlc19mb3JfdGVzdChjb25zdCBzdHJ1Y3QgdGVzdF9tb2RlICp0
KQogewotCWlmICh0LT5mZWF0dXJlID09IEZFQVRVUkVfREVGQVVMVCkKKwlpZiAodC0+ZmVhdHVy
ZSA9PSBGRUFUVVJFX0RFRkFVTFQpIHsKKwkJZmJjX3NldCgtMSk7CisJCXBzcl9zZXQoLTEpOwor
CQlkcnJzX3NldCgtMSk7CiAJCXJldHVybjsKKwl9CiAKIAlpZiAodC0+ZmVhdHVyZSAmIEZFQVRV
UkVfRkJDKQogCQlmYmNfc2V0KDEpOwotLSAKMi4xNi4yCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2lndC1kZXYK
