Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CDA56E460
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Oct 2018 12:02:59 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Fri, 26 Oct 2018 15:03:05 +0300
Message-Id: <20181026120305.18672-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2] lib/igt_fb: Fix unused variable buf.
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
Cc: stanislav.lisovskiy@intel.com, ville.syrjala@intel.com, martin.peres@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

RGVzcGl0ZSB0aGUgY29tbWVudCB0ZW1wb3JhcnkgYnVmIGlzIG5vdAp1c2VkIGFueXdoZXJlIGlu
IGNvbnZlcnRfbnYxMl90b19yZ2IyNCwKc28gaXQgaGFzIHRvIGJlIGVpdGhlciByZW1vdmVkIG9y
IHVzZWQgaW5zdGVhZApvZiBjdnQtPnNyYy5wdHIuCgp2MjogUHV0IGl0IGluIHVzZSBpbnN0ZWFk
IG9mIHJlbW92aW5nIGFzIG90aGVyCmZ1bmN0aW9ucyBzZWVtIHRvIHVzZSBpdC4KClNpZ25lZC1v
ZmYtYnk6IFN0YW5pc2xhdiBMaXNvdnNraXkgPHN0YW5pc2xhdi5saXNvdnNraXlAaW50ZWwuY29t
PgotLS0KIGxpYi9pZ3RfZmIuYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ZiLmMgYi9saWIvaWd0
X2ZiLmMKaW5kZXggNDcwMGIxNTIuLjVlNzc1YzQ0IDEwMDY0NAotLS0gYS9saWIvaWd0X2ZiLmMK
KysrIGIvbGliL2lndF9mYi5jCkBAIC0xNTM4LDggKzE1MzgsOCBAQCBzdGF0aWMgdm9pZCBjb252
ZXJ0X252MTJfdG9fcmdiMjQoc3RydWN0IGZiX2NvbnZlcnQgKmN2dCkKIAkgKiBmcm9tIHRoZXJl
LgogCSAqLwogCWlndF9tZW1jcHlfZnJvbV93YyhidWYsIGN2dC0+c3JjLnB0ciwgY3Z0LT5zcmMu
ZmItPnNpemUpOwotCXkgPSBjdnQtPnNyYy5wdHIgKyBjdnQtPnNyYy5mYi0+b2Zmc2V0c1swXTsK
LQl1diA9IGN2dC0+c3JjLnB0ciArIGN2dC0+c3JjLmZiLT5vZmZzZXRzWzFdOworCXkgPSBidWYg
KyBjdnQtPnNyYy5mYi0+b2Zmc2V0c1swXTsKKwl1diA9IGJ1ZiArIGN2dC0+c3JjLmZiLT5vZmZz
ZXRzWzFdOwogCiAJZm9yIChpID0gMDsgaSA8IGN2dC0+ZHN0LmZiLT5oZWlnaHQgLyAyOyBpKysp
IHsKIAkJZm9yIChqID0gMDsgaiA8IGN2dC0+ZHN0LmZiLT53aWR0aCAvIDI7IGorKykgewotLSAK
Mi4xNy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpp
Z3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
