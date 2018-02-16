Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Fri, 16 Feb 2018 09:00:23 +0000
Message-Id: <20180216090024.22548-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH igt 1/2] igt/kms_frontbuffer_tracking: Disable FBC
 testing for -ENODEV
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
To: intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJpcy13aWxzb24uY28udWs+Ci0t
LQogdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMgfCAzICsrKwogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2ttc19mcm9udGJ1ZmZlcl90
cmFja2luZy5jIGIvdGVzdHMva21zX2Zyb250YnVmZmVyX3RyYWNraW5nLmMKaW5kZXggMjYyMjk1
MmMuLjZjNDA3MWRlIDEwMDY0NAotLS0gYS90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcu
YworKysgYi90ZXN0cy9rbXNfZnJvbnRidWZmZXJfdHJhY2tpbmcuYwpAQCAtMTU4OCw2ICsxNTg4
LDkgQEAgc3RhdGljIGJvb2wgZmJjX3N1cHBvcnRlZF9vbl9jaGlwc2V0KHZvaWQpCiAJY2hhciBi
dWZbMTI4XTsKIAogCWRlYnVnZnNfcmVhZCgiaTkxNV9mYmNfc3RhdHVzIiwgYnVmKTsKKwlpZiAo
KmJ1ZiA9PSAnXDAnKQorCQlyZXR1cm4gZmFsc2U7CisKIAlyZXR1cm4gIXN0cnN0cihidWYsICJG
QkMgdW5zdXBwb3J0ZWQgb24gdGhpcyBjaGlwc2V0XG4iKTsKIH0KIAotLSAKMi4xNi4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
