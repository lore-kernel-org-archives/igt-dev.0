Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32DC68989C
 for <igt-dev@lists.freedesktop.org>; Thu,  9 May 2019 10:03:36 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu,  9 May 2019 13:03:22 +0300
Message-Id: <20190509100326.29224-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/5] meson/cc: Disable memory-allocating
 builtins
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

RGlzYWJsZSB0aGUgbWVtb3J5IGFsbG9jYXRpbmcgYnVpbHRpbnMgYXMgdGhleSBtYXkgY2F1c2Ug
dW5leHBlY3RlZCBiZWhhdmlvcgp3aXRoIG91ciBmcmFtZXdvcmsuIFRoZXkgKm1heSogZ2V0IG9w
dGltaXplZCBvdXQgaW4gZmF2b3Igb2YgYSByZWdpc3RlciBvcgpzdGFjayB2YXJpYWJsZSwgbWFr
aW5nIHRoZW0gZWZmZWN0aXZlbHkgbG9jYWwuCgpMb2NhbCB2YXJpYWJsZXMgZG8gbm90IHBsYXkg
d2VsbCB3aXRoIGxvbmdqbXAsIHdoaWNoIHdlIHVzZSBmb3IgZml4dHVyZXMKYW5kIHN1YnRlc3Rz
LgoKU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhpbGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwu
Y29tPgotLS0KIG1lc29uLmJ1aWxkIHwgNiArKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2Vy
dGlvbnMoKykKCmRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCmluZGV4IDgx
OTZhYjYzLi4yZDU0YzI4ZiAxMDA2NDQKLS0tIGEvbWVzb24uYnVpbGQKKysrIGIvbWVzb24uYnVp
bGQKQEAgLTYyLDYgKzYyLDEyIEBAIGNjX2FyZ3MgPSBbCiAJJy1XZXJyb3I9c2VxdWVuY2UtcG9p
bnQnLAogCSctV2Vycm9yPXRyaWdyYXBocycsCiAJJy1XZXJyb3I9d3JpdGUtc3RyaW5ncycsCisj
IERpc2FibGUgdGhlIG1lbW9yeSBhbGxvY2F0aW5nIGJ1aWx0aW5zIGFzIHRoZXkgbWF5IGNhdXNl
IHVuZXhwZWN0ZWQgYmVoYXZpb3IKKyMgd2l0aCBvdXIgZnJhbWV3b3JrLiBUaGV5ICptYXkqIGdl
dCBvcHRpbWl6ZWQgb3V0IGluIGZhdm9yIG9mIGEgcmVnaXN0ZXIgb3IKKyMgc3RhY2sgdmFyaWFi
bGUsIG1ha2luZyB0aGVtIGVmZmVjdGl2ZWx5IGxvY2FsLiBMb2NhbCB2YXJpYWJsZXMgZG8gbm90
IHBsYXkKKyMgd2VsbCB3aXRoIGxvbmdqbXAgd2hpY2ggaXMgaGVhdmlseSB1c2VkIGJ5IElHVCBm
cmFtZXdvcmsuCisJJy1mbm8tYnVpbHRpbi1tYWxsb2MnLAorCSctZm5vLWJ1aWx0aW4tY2FsbG9j
JywKIF0KIAogZm9yZWFjaCBjY19hcmcgOiBjY19hcmdzCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
