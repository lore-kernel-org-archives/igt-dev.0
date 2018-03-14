Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAC26E6B5
 for <igt-dev@lists.freedesktop.org>; Wed, 14 Mar 2018 11:20:29 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Wed, 14 Mar 2018 12:20:21 +0100
Message-Id: <20180314112021.60224-6-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180314112021.60224-1-maarten.lankhorst@linux.intel.com>
References: <20180314112021.60224-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 5/5] tests/kms_chv_cursor_fail: Handle
 cleanup better.
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

Q2xlYW4gdXAgY3Vyc29yIGZiIGluIGNsZWFudXBfY3J0Yywgd2hpY2ggbWVhbnMgdGhhdCBjdXJz
b3IgZmIKaGFzIHRvIGJlIGNyZWF0ZWQgYWZ0ZXIgcHJlcGFyZV9jcnRjKCkgaXMgY2FsbGVkLgoK
VGhpcyB3aWxsIGZpeCBhIHNtYWxsIGxlYWsgd2hlbiBhIHN1YnRlc3QgZmFpbHMuCgpTaWduZWQt
b2ZmLWJ5OiBNYWFydGVuIExhbmtob3JzdCA8bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwu
Y29tPgotLS0KIHRlc3RzL2ttc19jaHZfY3Vyc29yX2ZhaWwuYyB8IDcgKystLS0tLQogMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS90
ZXN0cy9rbXNfY2h2X2N1cnNvcl9mYWlsLmMgYi90ZXN0cy9rbXNfY2h2X2N1cnNvcl9mYWlsLmMK
aW5kZXggMGRkMzY2YzNiNGIxLi43MTM4ZTU0OWFlYjcgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19j
aHZfY3Vyc29yX2ZhaWwuYworKysgYi90ZXN0cy9rbXNfY2h2X2N1cnNvcl9mYWlsLmMKQEAgLTIy
NCw2ICsyMjQsNyBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwX2NydGMoZGF0YV90ICpkYXRhKQogCWRh
dGEtPnBpcGVfY3JjID0gTlVMTDsKIAogCWlndF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZGF0
YS0+cHJpbWFyeV9mYik7CisJaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZkYXRhLT5mYik7
CiB9CiAKIHN0YXRpYyB2b2lkIHByZXBhcmVfY3J0YyhkYXRhX3QgKmRhdGEpCkBAIC0yNjIsMTUg
KzI2MywxMSBAQCBzdGF0aWMgdm9pZCBwcmVwYXJlX2NydGMoZGF0YV90ICpkYXRhKQogCiBzdGF0
aWMgdm9pZCB0ZXN0X2NydGMoZGF0YV90ICpkYXRhLCB1bnNpZ25lZCBpbnQgZWRnZXMpCiB7Ci0J
Y2xlYW51cF9jcnRjKGRhdGEpOworCXByZXBhcmVfY3J0YyhkYXRhKTsKIAogCWNyZWF0ZV9jdXJz
b3JfZmIoZGF0YSwgZGF0YS0+Y3VydywgZGF0YS0+Y3VyaCk7CiAKLQlwcmVwYXJlX2NydGMoZGF0
YSk7Ci0KIAl0ZXN0X2VkZ2VzKGRhdGEsIGVkZ2VzKTsKLQotCWlndF9yZW1vdmVfZmIoZGF0YS0+
ZHJtX2ZkLCAmZGF0YS0+ZmIpOwogfQogCiBzdGF0aWMgaW50IG9wdF9oYW5kbGVyKGludCBvcHQs
IGludCBvcHRfaW5kZXgsIHZvaWQgKl9kYXRhKQotLSAKMi4xNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
