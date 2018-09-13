Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
Date: Thu, 13 Sep 2018 14:24:31 +0100
Message-Id: <20180913132432.4105-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Require drmModeResources()
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
Cc: intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

SWYgbW9kZXNldHRpbmcgaXMgbm90IHN1cHBvcnRlZCwgdGhlIGRybU1vZGVHZXRSZXNvdXJjZXMo
KSBjYWxsIHdpbGwKZmFpbCB3aXRoIC1FSU5WQUwgKG9yIC1FTk9UU1VQUCkuIEFzIG5vIGRpc3Bs
YXlzIGFyZSBjb25uZWN0ZWQsIHNraXAuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpcyBXaWxzb24gPGNo
cmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggM2UwYTA3Yjk4Li4wZTZmOTE0NzUgMTAw
NjQ0Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAtMTg1Nyw3ICsx
ODU3LDcgQEAgdm9pZCBpZ3RfZGlzcGxheV9pbml0KGlndF9kaXNwbGF5X3QgKmRpc3BsYXksIGlu
dCBkcm1fZmQpCiAJZGlzcGxheS0+ZHJtX2ZkID0gZHJtX2ZkOwogCiAJcmVzb3VyY2VzID0gZHJt
TW9kZUdldFJlc291cmNlcyhkaXNwbGF5LT5kcm1fZmQpOwotCWlndF9hc3NlcnQocmVzb3VyY2Vz
KTsKKwlpZ3RfcmVxdWlyZShyZXNvdXJjZXMpOwogCiAJLyoKIAkgKiBXZSBjYWNoZSB0aGUgbnVt
YmVyIG9mIHBpcGVzLCB0aGF0IG51bWJlciBpcyBhIHBoeXNpY2FsIGxpbWl0IG9mIHRoZQotLSAK
Mi4xOS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
