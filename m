Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8745B6EE0E
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jan 2019 19:11:24 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon,  7 Jan 2019 11:10:54 -0800
Message-Id: <20190107191056.22759-6-jose.souza@intel.com>
In-Reply-To: <20190107191056.22759-1-jose.souza@intel.com>
References: <20190107191056.22759-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 6/8] tests/fbcon_fbt: Use psr_wait_exit() to
 test updates in PSR
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

SXQgd2lsbCB0ZXN0IHdhcyBpcyBpbnRlbnRlZCBhbmQgZmFzdGVyIGFzIGluIHRoZSBmaXJzdCBv
Y2N1cmVuY2Ugb2YKUFNSIGV4aXQgaXQgd2lsbCByZXR1cm4gaW5zdGVhZCBvZiB3YWl0IHRoZSB0
aW1lb3V0IG9mCnBzcl93YWl0X2VudHJ5KCkuCgpDYzogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhp
bmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+CkNjOiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2
aUBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291emEgPGpvc2Uu
c291emFAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc19mYmNvbl9mYnQuYyB8IDIgKy0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rl
c3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rlc3RzL2ttc19mYmNvbl9mYnQuYwppbmRleCBjMGQxNzUy
ZS4uM2UyMThkYzggMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYworKysgYi90ZXN0
cy9rbXNfZmJjb25fZmJ0LmMKQEAgLTE5OCw3ICsxOTgsNyBAQCBzdGF0aWMgYm9vbCBwc3Jfd2Fp
dF91bnRpbF9lbmFibGVkKGludCBkZWJ1Z2ZzX2ZkKQogCiBzdGF0aWMgYm9vbCBwc3Jfd2FpdF91
bnRpbF91cGRhdGUoaW50IGRlYnVnZnNfZmQpCiB7Ci0JcmV0dXJuICFwc3Jfd2FpdF91bnRpbF9l
bmFibGVkKGRlYnVnZnNfZmQpOworCXJldHVybiBwc3Jfd2FpdF9leGl0KGRlYnVnZnNfZmQpOwog
fQogCiBzdGF0aWMgdm9pZCBkaXNhYmxlX2ZlYXR1cmVzKGludCBkZWJ1Z2ZzX2ZkKQotLSAKMi4y
MC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3Qt
ZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
