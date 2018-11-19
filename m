Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl [141.105.120.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B62A289B84
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Nov 2018 11:05:32 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 19 Nov 2018 12:05:28 +0100
Message-Id: <20181119110528.12877-2-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20181119110528.12877-1-maarten.lankhorst@linux.intel.com>
References: <20181119110528.12877-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_render_tiled_blits: Make
 sure igt_buf is initially zero'd
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

Z2VuOF9iaW5kX2J1ZiBsb29rcyBhdCBidWYtPmF1eC5zdHJpZGUvb2Zmc2V0LCB3aGljaCBpcyBu
b3Qgc2V0IGJ5IHRoZQp0ZXN0LiBXaGVuIEkgYWRkZWQgdGhlIGJwcCBmaWVsZCwgaXQgd2FzIGVu
b3VnaCB0byBtYWtlIHRoZSB0ZXN0IGZhaWwsCmZpeCB0aGlzIGJ5IG1ha2luZyBzdXJlIHRoYXQg
dGhlIGJ1ZiBpcyBpbml0aWFsbHkgemVybydkIGV4cGxpY2l0bHksCndoaWNoIGZpeGVzIHRoZSB0
ZXN0IHRvIHJ1biByZWxpYWJseSAxMDAlIG9mIHRoZSB0aW1lLgoKU2lnbmVkLW9mZi1ieTogTWFh
cnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbT4KLS0tCiB0
ZXN0cy9pOTE1L2dlbV9yZW5kZXJfdGlsZWRfYmxpdHMuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUv
Z2VtX3JlbmRlcl90aWxlZF9ibGl0cy5jIGIvdGVzdHMvaTkxNS9nZW1fcmVuZGVyX3RpbGVkX2Js
aXRzLmMKaW5kZXggMzAwN2YyYWJkNjU1Li4xMjk1MDA2MTYzMTUgMTAwNjQ0Ci0tLSBhL3Rlc3Rz
L2k5MTUvZ2VtX3JlbmRlcl90aWxlZF9ibGl0cy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3JlbmRl
cl90aWxlZF9ibGl0cy5jCkBAIC0xMjEsNyArMTIxLDcgQEAgc3RhdGljIHZvaWQgcnVuX3Rlc3Qg
KGludCBmZCwgaW50IGNvdW50KQogCQlpZ3RfaW5mbygiVXNpbmcgYSBzbm9vcCBsaW5lYXIgYnVm
ZmVyIGZvciBjb21wYXJpc29uc1xuIik7CiAJfQogCi0JYnVmID0gbWFsbG9jKHNpemVvZigqYnVm
KSpjb3VudCk7CisJYnVmID0gY2FsbG9jKHNpemVvZigqYnVmKSwgY291bnQpOwogCXN0YXJ0X3Zh
bCA9IG1hbGxvYyhzaXplb2YoKnN0YXJ0X3ZhbCkqY291bnQpOwogCiAJZm9yIChpID0gMDsgaSA8
IGNvdW50OyBpKyspIHsKLS0gCjIuMTkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KaWd0LWRldiBtYWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9pZ3QtZGV2Cg==
