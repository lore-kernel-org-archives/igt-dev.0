Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79853894DE
 for <igt-dev@lists.freedesktop.org>; Thu,  7 Mar 2019 08:19:37 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu,  7 Mar 2019 10:19:19 +0200
Message-Id: <20190307081919.26606-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] HAX: add 'i915:' to dmesg patterns and
 disregard KERN_NOTICE
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

U3RvcC1nYXAgYmVmb3JlIGRyb3BwaW5nIC0tcGlnbGl0LXN0eWxlLWRtZXNnIGNvbXBsZXRlbHku
CgpUaGlzIGlzIGp1c3QgZm9yIHRlc3RpbmcsIHRvIGFzc2VzIHRoZSBhbW91bnQgb2Ygd29yayB0
aGlzIHdpbGwgY2F1c2UKZm9yIGJ1Zy1yZXBvcnRpbmcuIFdoZW4gaW1wbGVtZW50ZWQgcHJvcGVy
bHkgaXQgd2lsbCBlbmQgdXAgYXMgYQpzZXBhcmF0ZSBzd2l0Y2goZXMpLgotLS0KIHJ1bm5lci9y
ZXN1bHRnZW4uYyB8IDQgKystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9ydW5uZXIvcmVzdWx0Z2VuLmMgYi9ydW5uZXIvcmVz
dWx0Z2VuLmMKaW5kZXggMzJiNTlkNTkuLmZlZTQ2ZGI4IDEwMDY0NAotLS0gYS9ydW5uZXIvcmVz
dWx0Z2VuLmMKKysrIGIvcnVubmVyL3Jlc3VsdGdlbi5jCkBAIC00OTcsNyArNDk3LDcgQEAgc3Rh
dGljIGNvbnN0IGNoYXIgaWd0X2RtZXNnX3doaXRlbGlzdFtdID0KICN1bmRlZiBfCiAKIHN0YXRp
YyBjb25zdCBjaGFyIGlndF9waWdsaXRfc3R5bGVfZG1lc2dfYmxhY2tsaXN0W10gPQotCSIoXFxb
ZHJtOnxkcm1ffGludGVsX3xpOTE1XykiOworCSIoXFxbZHJtOnxkcm1ffGludGVsX3xpOTE1X3xp
OTE1OikiOwogCiBzdGF0aWMgcmVnZXhfdCByZTsKIApAQCAtNjc4LDcgKzY3OCw3IEBAIHN0YXRp
YyBib29sIGZpbGxfZnJvbV9kbWVzZyhpbnQgZmQsCiAJCX0KIAogCQlpZiAoc2V0dGluZ3MtPnBp
Z2xpdF9zdHlsZV9kbWVzZykgewotCQkJaWYgKChmbGFncyAmIDB4MDcpIDw9IDUgJiYgY29udGlu
dWF0aW9uICE9ICdjJyAmJgorCQkJaWYgKChmbGFncyAmIDB4MDcpIDw9IDQgJiYgY29udGludWF0
aW9uICE9ICdjJyAmJgogCQkJICAgIHJlZ2V4ZWMoJnJlLCBtZXNzYWdlLCAoc2l6ZV90KTAsIE5V
TEwsIDApICE9IFJFR19OT01BVENIKSB7CiAJCQkJYXBwZW5kX2xpbmUoJndhcm5pbmdzLCAmd2Fy
bmluZ3NsZW4sIGZvcm1hdHRlZCk7CiAJCQl9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1k
ZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vaWd0LWRldg==
