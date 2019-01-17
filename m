Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877F16F5C8
 for <igt-dev@lists.freedesktop.org>; Thu, 17 Jan 2019 23:59:53 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu, 17 Jan 2019 15:59:44 -0800
Message-Id: <20190117235949.20026-2-jose.souza@intel.com>
In-Reply-To: <20190117235949.20026-1-jose.souza@intel.com>
References: <20190117235949.20026-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v4 2/7] lib/psr: Only care about DEEP_SLEEP
 state for PSR2
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

VG8gY2hlY2sgaWYgUFNSIGlzIGFjdGl2ZSBpdCBzZWFyY2ggZm9yIFNSREVOVCBmb3IgUFNSMSBh
bmQgaXQgd2FzCnNlYXJjaGluZyBmb3IgU0xFRVAgZm9yIFBTUjIgYnV0IGl0IHNob3VsZCByZWFs
bHkgc2VhY2ggZm9yCkRFRVBfU0xFRVAgYXMgaW4gdGhpcyBzdGF0ZSBkaXNwbGF5IGJsb2NrIGlz
IGFjdHVhbHkgc2F2aW5nIGEKc3Vic3RhbmNpYWwgYW1vdW50IG9mIHBvd2VyLgoKQ2M6IERoaW5h
a2FyYW4gUGFuZGl5YW4gPGRoaW5ha2FyYW4ucGFuZGl5YW5AaW50ZWwuY29tPgpSZXZpZXdlZC1i
eTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNp
Z25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29t
PgotLS0KIGxpYi9pZ3RfcHNyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9w
c3IuYwppbmRleCBhNTlmZjk0ZS4uODNjNWI5ODYgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfcHNyLmMK
KysrIGIvbGliL2lndF9wc3IuYwpAQCAtMzMsNyArMzMsNyBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0
aXZlKGludCBkZWJ1Z2ZzX2ZkLCBib29sIGNoZWNrX2FjdGl2ZSkKIAlpZ3RfZGVidWdmc19zaW1w
bGVfcmVhZChkZWJ1Z2ZzX2ZkLCAiaTkxNV9lZHBfcHNyX3N0YXR1cyIsIGJ1ZiwKIAkJCQlzaXpl
b2YoYnVmKSk7CiAKLQlhY3RpdmUgPSBzdHJzdHIoYnVmLCAiU1JERU5UIikgfHwgc3Ryc3RyKGJ1
ZiwgIlNMRUVQIik7CisJYWN0aXZlID0gc3Ryc3RyKGJ1ZiwgIlNSREVOVCIpIHx8IHN0cnN0cihi
dWYsICJERUVQX1NMRUVQIik7CiAJcmV0dXJuIGNoZWNrX2FjdGl2ZSA/IGFjdGl2ZSA6ICFhY3Rp
dmU7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
