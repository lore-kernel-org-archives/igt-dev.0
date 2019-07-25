Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD3AC6E736
 for <igt-dev@lists.freedesktop.org>; Thu, 25 Jul 2019 12:36:17 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 25 Jul 2019 15:35:43 +0300
Message-Id: <20190725123546.16038-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/4] tests/kms_3d: Unset all crtcs before
 the test
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCk9u
IHByZS1IU1cgd2UgaGF2ZSBzZXBhcmF0ZSBlbmNvZGVycyBmb3IgdGhlIERQIGFuZCBIRE1JIHBv
cnRzLApidXQgYm90aCBjYW4ndCBiZSBlbmFibGVkIGF0IHRoZSBzYW1lIHRpbWUuIFRoZSB0ZXN0
IGZhaWxzIHRvCmFjY291bnQgZm9yIHRoYXQgYW5kIGNhbiB0aHVzIGZhaWwgd2hlbiB0aGUga2Vy
bmVsIHJlamVjdHMKdGhlIG1vZGVzZXQuIFdlIGNhbiBhdm9pZCB0aGF0IGJ5IHR1cm5pbmcgb2Zm
IGFsbCB0aGUgcG9ydHMKYmVmb3JlaGFuZC4KCnYyOiByZWJhc2VkIChBcmVrKQoKQ2M6IFNpbW9u
IFNlciA8c2ltb24uc2VyQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6
IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHRlc3RzL2ttc18zZC5jIHwg
MiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL3Rlc3Rz
L2ttc18zZC5jIGIvdGVzdHMva21zXzNkLmMKaW5kZXggOGFkZTZkMzQuLmFlZDNiZWUzIDEwMDY0
NAotLS0gYS90ZXN0cy9rbXNfM2QuYworKysgYi90ZXN0cy9rbXNfM2QuYwpAQCAtNTYsNiArNTYs
OCBAQCBpZ3Rfc2ltcGxlX21haW4KIAl9CiAJaWd0X3JlcXVpcmUoY29ubmVjdG9yKTsKIAorCWtt
c3Rlc3RfdW5zZXRfYWxsX2NydGNzKGRybV9mZCwgcmVzKTsKKwogCWVkaWQgPSBpZ3Rfa21zX2dl
dF8zZF9lZGlkKCk7CiAKIAlrbXN0ZXN0X2ZvcmNlX2VkaWQoZHJtX2ZkLCBjb25uZWN0b3IsIGVk
aWQpOwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
