Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 575926E084
 for <igt-dev@lists.freedesktop.org>; Tue, 29 Jan 2019 00:02:14 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Mon, 28 Jan 2019 16:02:07 -0800
Message-Id: <20190129000209.9151-4-jose.souza@intel.com>
In-Reply-To: <20190129000209.9151-1-jose.souza@intel.com>
References: <20190129000209.9151-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v1-rebased 4/6] tests/fbcon_fbt: Use
 psr_wait_update() to test updates in PSR
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
c3RzL2ttc19mYmNvbl9mYnQuYyBiL3Rlc3RzL2ttc19mYmNvbl9mYnQuYwppbmRleCA5YWIxZDYz
MC4uYjU3ZTVmNTEgMTAwNjQ0Ci0tLSBhL3Rlc3RzL2ttc19mYmNvbl9mYnQuYworKysgYi90ZXN0
cy9rbXNfZmJjb25fZmJ0LmMKQEAgLTIwMyw3ICsyMDMsNyBAQCBzdGF0aWMgYm9vbCBwc3Jfc3Vw
cG9ydGVkX29uX2NoaXBzZXQoaW50IGRlYnVnZnNfZmQpCiAKIHN0YXRpYyBib29sIHBzcl93YWl0
X3VudGlsX3VwZGF0ZShpbnQgZGVidWdmc19mZCkKIHsKLQlyZXR1cm4gIXBzcl93YWl0X3VudGls
X2VuYWJsZWQoZGVidWdmc19mZCk7CisJcmV0dXJuIHBzcl93YWl0X3VwZGF0ZShkZWJ1Z2ZzX2Zk
LCBQU1JfTU9ERV8xKTsKIH0KIAogc3RhdGljIHZvaWQgZGlzYWJsZV9mZWF0dXJlcyhpbnQgZGVi
dWdmc19mZCkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3Qt
ZGV2Cg==
