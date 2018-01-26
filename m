Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D0956E466
 for <igt-dev@lists.freedesktop.org>; Fri, 26 Jan 2018 18:33:02 +0000 (UTC)
From: Antonio Argenziano <antonio.argenziano@intel.com>
Date: Fri, 26 Jan 2018 10:32:57 -0800
Message-Id: <20180126183257.17794-1-antonio.argenziano@intel.com>
Subject: [igt-dev] [PATCH i-g-t] lib/hang_detector: Log message if UDEV lib
 is missing
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
List-ID: <igt-dev@lists.freedesktop.org>

TG9nIGEgbWVzc2FnZSBzYXlpbmcgdGhhdCBoYW5nIGRldGVjdG9yIGRpZCBub3Qgc3RhcnQgYmVj
YXVzZSB3ZSBhcmUgbWlzc2luZwphIGxpYnJhcnkuCgpTaWduZWQtb2ZmLWJ5OiBBbnRvbmlvIEFy
Z2Vuemlhbm8gPGFudG9uaW8uYXJnZW56aWFub0BpbnRlbC5jb20+CkNjOiBDaHJpcyBXaWxzb24g
PGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4K
LS0tCiBsaWIvaWd0X2F1eC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9saWIvaWd0X2F1eC5jIGIvbGliL2lndF9h
dXguYwppbmRleCA4Y2EwYjYwZC4uMDhjYjk1N2YgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3RfYXV4LmMK
KysrIGIvbGliL2lndF9hdXguYwpAQCAtNTA5LDggKzUwOSw3IEBAIHZvaWQgaWd0X3N0b3BfaGFu
Z19kZXRlY3Rvcih2b2lkKQogI2Vsc2UKIHZvaWQgaWd0X2ZvcmtfaGFuZ19kZXRlY3RvcihpbnQg
ZmQpCiB7Ci0JaWYgKGlndF9vbmx5X2xpc3Rfc3VidGVzdHMoKSkKLQkJcmV0dXJuOworCWlndF9p
bmZvKCJNaXNzaW5nIFVkZXYgbGlicmFyeSwgaGFuZyBkZXRlY3RvciBkaWQgbm90IHN0YXJ0IVxu
Iik7CiB9CiAKIHZvaWQgaWd0X3N0b3BfaGFuZ19kZXRlY3Rvcih2b2lkKQotLSAKMi4xNC4yCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1h
aWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
