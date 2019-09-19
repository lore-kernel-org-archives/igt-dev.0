Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12FC06F7ED
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Sep 2019 17:37:05 +0000 (UTC)
From: Anshuman Gupta <anshuman.gupta@intel.com>
Date: Thu, 19 Sep 2019 23:00:27 +0530
Message-Id: <20190919173033.20962-1-anshuman.gupta@intel.com>
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
Cc: jyoti.r.yadav@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

U2VuZGluZyB2MTQgc2VyaWVzIGFnYWluIGFmdGVyIGRvaW5nIG1pbm9yIGNvc21ldGljcyBmaXhl
cyBpbiBvcmRlciB0byBhZGQgCkltcmUncyBSQiAoSW1yZSBoYXMgcHJvdmlkZWQgUkIgd2l0aCBz
b21lIG1pbm9yIGNvc21ldGljcyBmaXhlcykgCkFsc28gYWRkZWQgbW9yZSBkZXNjcmlwdGl2ZSBE
b2N1bWVudGF0aW9uIHN1Z2dlc3RlZCBieSBQZXRyaS4KCkFuc2h1bWFuIEd1cHRhICgxKToKICB0
ZXN0cy9pOTE1L2k5MTVfcG1fZGM6U2tpcCB0aGUgREM2IHRlc3QgaWYgQklPUyBoYXMgZGlzYWJs
ZWQgUEM4KwoKSnlvdGkgWWFkYXYgKDUpOgogIGxpYi9pZ3RfcG06IGlndCBsaWIgaGVscGVyIHJv
dXRpbmVzIHRvIHN1cHBvcnQgREM1LzYgdGVzdHMKICB0ZXN0cy9pOTE1L2k5MTVfcG1fZGM6IEFk
ZGVkIG5ldyB0ZXN0IHRvIHZlcmlmeSBEaXNwbGF5IEMgU3RhdGVzCiAgdGVzdHMvaTkxNS9pOTE1
X3BtX2RjOiBBZGRlZCB0ZXN0IGZvciBEQzYgZHVyaW5nIFBTUgogIHRlc3RzL2k5MTUvaTkxNV9w
bV9kYzogQWRkZWQgdGVzdCBmb3IgREM1IGR1cmluZyBEUE1TCiAgdGVzdHMvaTkxNS9pOTE1X3Bt
X2RjOiBBZGRlZCB0ZXN0IGZvciBEQzYgZHVyaW5nIERQTVMKCiBsaWIvaWd0X3BtLmMgICAgICAg
ICAgICAgICAgICAgfCAyMTUgKysrKysrKysrKysrKysrKysrLS0tLS0KIGxpYi9pZ3RfcG0uaCAg
ICAgICAgICAgICAgICAgICB8ICAgNyArLQogdGVzdHMvTWFrZWZpbGUuc291cmNlcyAgICAgICAg
IHwgICAzICsKIHRlc3RzL2k5MTUvaTkxNV9wbV9iYWNrbGlnaHQuYyB8ICAgNiArLQogdGVzdHMv
aTkxNS9pOTE1X3BtX2RjLmMgICAgICAgIHwgMzEwICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKwogdGVzdHMvaTkxNS9pOTE1X3BtX3JwbS5jICAgICAgIHwgIDM5ICstLS0tCiB0ZXN0
cy9tZXNvbi5idWlsZCAgICAgICAgICAgICAgfCAgIDEgKwogNyBmaWxlcyBjaGFuZ2VkLCA0OTMg
aW5zZXJ0aW9ucygrKSwgODggZGVsZXRpb25zKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMv
aTkxNS9pOTE1X3BtX2RjLmMKCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vaWd0LWRldg==
