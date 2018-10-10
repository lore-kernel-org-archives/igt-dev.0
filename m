Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A30689F08
 for <igt-dev@lists.freedesktop.org>; Wed, 10 Oct 2018 12:02:15 +0000 (UTC)
From: Jyoti Yadav <jyoti.r.yadav@intel.com>
Date: Wed, 10 Oct 2018 08:01:43 -0400
Message-Id: <1539172908-20679-1-git-send-email-jyoti.r.yadav@intel.com>
Subject: [igt-dev] [PATCH i-g-t v2 0/5] Added new test file pm_dc.c.
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
Cc: Jyoti Yadav <jyoti.r.yadav@intel.com>, anusha.srivatsa@intel.com, rodrigo.vivi@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhpcyBwYXRjaCBzZXJpZXMgYWRkcyBuZXcgdGVzdHMgdG8gdmFsaWRhdGUgRGlzcGxheSBDIHN0
YXRlcy4KREMgc3RhdGVzIGxpa2UgREM1IGFuZCBEQzYgYXJlIHZhbGlkYXRlZCBkdXJpbmcgUFNS
IGVudHJ5L2V4aXQKYW5kIGR1cmluZyBEUE1TIG9uL29mZiBjeWNsZS4KCgpKeW90aSBZYWRhdiAo
NSk6CiAgW2ludGVsLS1nZnhdW2lndC1kZXZdIGxpYi9pZ3RfcG06IE1vdmVzIERtY19sb2FkZWQo
KSBmdW5jdGlvbiBpbnRvCiAgICBsaWJyYXJ5LgogIFtpbnRlbC1nZnhdW2lndC1kZXZdIHRlc3Rz
L3BtX2RjIDogQWRkZWQgbmV3IHRlc3QgdG8gdmVyaWZ5IERpc3BsYXkgQwogICAgU3RhdGVzLgog
IFtpbnRlbC1nZnhdW2lndC1kZXZdIHRlc3RzL3BtX2RjOiBBZGRlZCB0ZXN0IGZvciBEQzYgZHVy
aW5nIFBTUi4KICBbaW50ZWwtZ2Z4XVtpZ3QtZGV2XSB0ZXN0cy9wbV9kYzogQWRkZWQgdGVzdCBm
b3IgREM1IGR1cmluZyBEUE1TLgogIFtpbnRlbC1nZnhdW2lndC1kZXZdIHRlc3RzL3BtX2RjOiBB
ZGRlZCB0ZXN0IGZvciBEQzYgZHVyaW5nIERQTVMuCgogbGliL2lndF9wbS5jICAgICAgICAgICB8
ICAyOCArKysrKysKIGxpYi9pZ3RfcG0uaCAgICAgICAgICAgfCAgIDEgKwogdGVzdHMvTWFrZWZp
bGUuc291cmNlcyB8ICAgMSArCiB0ZXN0cy9tZXNvbi5idWlsZCAgICAgIHwgICAxICsKIHRlc3Rz
L3BtX2RjLmMgICAgICAgICAgfCAyNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogdGVzdHMvcG1fcnBtLmMgICAgICAgICB8ICAxNyArLS0tCiA2IGZp
bGVzIGNoYW5nZWQsIDI5MSBpbnNlcnRpb25zKCspLCAxNiBkZWxldGlvbnMoLSkKIGNyZWF0ZSBt
b2RlIDEwMDY0NCB0ZXN0cy9wbV9kYy5jCgotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vaWd0LWRldgo=
