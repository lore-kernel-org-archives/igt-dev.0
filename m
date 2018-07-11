Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Wed, 11 Jul 2018 09:46:18 +0100
Message-Id: <20180711084619.27634-1-chris@chris-wilson.co.uk>
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/kmod: Fail if the module is already
 loaded
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

SWYgd2Ugd2FudCB0byBzZXQgbmV3IG1vZHVsZSBvcHRpb25zLCB3ZSBtdXN0IGxvYWQgdGhlIG1v
ZHVsZSBvciBkaWUKdHJ5aW5nLiBXZSBtYXkgd2FudCB0byBhbHdheXMgZmFpbCBpZiB0aGUgbW9k
dWxlIGlmIGFscmVhZHkgbG9hZGVkLCBidXQKZm9yIG5vdywgdGFrZSB0aGUgc21hbGwgaW5jcmVt
ZW50YWwgc3RlcCBhbmQgaW5zaXN0IHRoYXQgdGhlIG9wdGlvbnMgYXJlCnNldCBpZiByZXF1ZXN0
ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51
az4KLS0tCiBsaWIvaWd0X2ttb2QuYyB8IDggKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCA3IGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttb2QuYyBi
L2xpYi9pZ3Rfa21vZC5jCmluZGV4IDRmNzBlMzBkOS4uZjNmMzRhNjJkIDEwMDY0NAotLS0gYS9s
aWIvaWd0X2ttb2QuYworKysgYi9saWIvaWd0X2ttb2QuYwpAQCAtMTQxLDcgKzE0MSwxMyBAQCBv
dXQ6CiAKIHN0YXRpYyBpbnQgbW9kcHJvYmUoc3RydWN0IGttb2RfbW9kdWxlICprbW9kLCBjb25z
dCBjaGFyICpvcHRpb25zKQogewotCXJldHVybiBrbW9kX21vZHVsZV9wcm9iZV9pbnNlcnRfbW9k
dWxlKGttb2QsIDAsIG9wdGlvbnMsCisJdW5zaWduZWQgaW50IGZsYWdzOworCisJZmxhZ3MgPSAw
OworCWlmIChvcHRpb25zKSAvKiBmb3JjZSBhIGZyZXNoIGxvYWQgdG8gc2V0IHRoZSBuZXcgb3B0
aW9ucyAqLworCQlmbGFncyB8PSBLTU9EX1BST0JFX0ZBSUxfT05fTE9BREVEOworCisJcmV0dXJu
IGttb2RfbW9kdWxlX3Byb2JlX2luc2VydF9tb2R1bGUoa21vZCwgZmxhZ3MsIG9wdGlvbnMsCiAJ
CQkJCSAgICAgICBOVUxMLCBOVUxMLCBOVUxMKTsKIH0KIAotLSAKMi4xOC4wCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlz
dAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
