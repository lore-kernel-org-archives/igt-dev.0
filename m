Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CB9A6EB39
 for <igt-dev@lists.freedesktop.org>; Thu,  3 Jan 2019 14:37:02 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Thu,  3 Jan 2019 06:36:37 -0800
Message-Id: <20190103143641.20200-5-jose.souza@intel.com>
In-Reply-To: <20190103143641.20200-1-jose.souza@intel.com>
References: <20190103143641.20200-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 5/9] lib/psr: Make psr_active() only
 cares about PSR1
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
Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

UFNSMiB3aWxsIGhhdmUgaXQgb3duIGZ1bmN0aW9uIHRvIGRldGVjdCBpZiBpcyBhY3RpdmUgc28g
d2UgY2FuIGRyb3AKdGhlIHNsZWVwIHN0YXRlIHNlYXJjaCBhcyBpdCBpcyBhIFBTUjIgc3RhdGUu
CgpDYzogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgpDYzogRGhpbmFrYXJh
biBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6
IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGxpYi9p
Z3RfcHNyLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X3Bzci5jIGIvbGliL2lndF9wc3IuYwppbmRleCA4
ZWZjOTIxNi4uNTVmNjFjMjUgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfcHNyLmMKKysrIGIvbGliL2ln
dF9wc3IuYwpAQCAtMzUsNyArMzUsNyBAQCBzdGF0aWMgYm9vbCBwc3JfYWN0aXZlKGludCBkZWJ1
Z2ZzX2ZkLCBib29sIGNoZWNrX2FjdGl2ZSkKIAogCWFjdGl2ZSA9IHN0cnN0cihidWYsICJIVyBF
bmFibGVkICYgQWN0aXZlIGJpdDogeWVzXG4iKSB8fAogCQkgc3Ryc3RyKGJ1ZiwgIlNvdXJjZSBQ
U1IgY3RsOiBlbmFibGVkIik7Ci0JYWN0aXZlID0gYWN0aXZlICYmIChzdHJzdHIoYnVmLCAiU1JE
RU5UIikgfHwgc3Ryc3RyKGJ1ZiwgIlNMRUVQIikpOworCWFjdGl2ZSA9IGFjdGl2ZSAmJiBzdHJz
dHIoYnVmLCAiU1JERU5UIik7CiAJcmV0dXJuIGNoZWNrX2FjdGl2ZSA/IGFjdGl2ZSA6ICFhY3Rp
dmU7CiB9CiAKLS0gCjIuMjAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
