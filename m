Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5665C89C68
 for <igt-dev@lists.freedesktop.org>; Wed,  4 Sep 2019 17:54:11 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Wed,  4 Sep 2019 23:21:03 +0530
Message-Id: <20190904175109.24626-1-anshuman.gupta@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v14 0/6] DC states igt tests patch series
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
Cc: jyoti.r.yadav@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBpcyB2MTQgb2YgcGF0Y2ggc2VyaWVzLCBhZnRlciBzb21lIHJlZmFjdG9yaW5nCmFuZCBt
aW5vciByZXZpZXcgY29tbWVudCBmaXhlcy4gCgpBbnNodW1hbiBHdXB0YSAoMSk6CiAgdGVzdHMv
aTkxNS9pOTE1X3BtX2RjOlNraXAgdGhlIERDNiB0ZXN0IGlmIEJJT1MgaGFzIGRpc2FibGVkIFBD
OCsKCkp5b3RpIFlhZGF2ICg1KToKICBsaWIvaWd0X3BtOiBpZ3QgbGliIGhlbHBlciByb3V0aW5l
cyB0byBzdXBwb3J0IERDNS82IHRlc3RzCiAgdGVzdHMvaTkxNS9pOTE1X3BtX2RjOiBBZGRlZCBu
ZXcgdGVzdCB0byB2ZXJpZnkgRGlzcGxheSBDIFN0YXRlcwogIHRlc3RzL2k5MTUvaTkxNV9wbV9k
YzogQWRkZWQgdGVzdCBmb3IgREM2IGR1cmluZyBQU1IKICB0ZXN0cy9pOTE1L2k5MTVfcG1fZGM6
IEFkZGVkIHRlc3QgZm9yIERDNSBkdXJpbmcgRFBNUwogIHRlc3RzL2k5MTUvaTkxNV9wbV9kYzog
QWRkZWQgdGVzdCBmb3IgREM2IGR1cmluZyBEUE1TCgogbGliL2lndF9wbS5jICAgICAgICAgICAg
ICAgICAgIHwgMjE1ICsrKysrKysrKysrKysrKysrKy0tLS0tCiBsaWIvaWd0X3BtLmggICAgICAg
ICAgICAgICAgICAgfCAgIDcgKy0KIHRlc3RzL01ha2VmaWxlLnNvdXJjZXMgICAgICAgICB8ICAg
MyArCiB0ZXN0cy9pOTE1L2k5MTVfcG1fYmFja2xpZ2h0LmMgfCAgIDYgKy0KIHRlc3RzL2k5MTUv
aTkxNV9wbV9kYy5jICAgICAgICB8IDMwMSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysKIHRlc3RzL2k5MTUvaTkxNV9wbV9ycG0uYyAgICAgICB8ICAzOSArLS0tLQogdGVzdHMvbWVz
b24uYnVpbGQgICAgICAgICAgICAgIHwgICAxICsKIDcgZmlsZXMgY2hhbmdlZCwgNDg0IGluc2Vy
dGlvbnMoKyksIDg4IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2k5MTUv
aTkxNV9wbV9kYy5jCgotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2lndC1kZXY=
