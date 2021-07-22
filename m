Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830CA6E88A
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jul 2021 08:24:42 +0000 (UTC)
From: Andrzej Turko <andrzej.turko@linux.intel.com>
Date: Thu, 22 Jul 2021 10:24:25 +0200
Message-Id: <20210722082426.4538-2-andrzej.turko@linux.intel.com>
In-Reply-To: <20210722082426.4538-1-andrzej.turko@linux.intel.com>
References: <20210722082426.4538-1-andrzej.turko@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib/intel_allocator_simple: Check
 boundaries of reserved blocks
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

TWFrZSBzdXJlIHRoYXQgcmVzZXJ2ZWQgYmxvY2tzIGZpdCBpbiB0aGUKYWRkcmVzcyBzcGFjZSBt
YW5hZ2VkIGJ5IHRoZSBzaW1wbGUgYWxsb2NhdG9yLgoKU2lnbmVkLW9mZi1ieTogQW5kcnplaiBU
dXJrbyA8YW5kcnplai50dXJrb0BsaW51eC5pbnRlbC5jb20+CkNjOiBaYmlnbmlldyBLZW1wY3p5
xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGludGVsLmNvbT4KLS0tCiBsaWIvaW50ZWxfYWxs
b2NhdG9yX3NpbXBsZS5jIHwgMiArKwogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2xpYi9pbnRlbF9hbGxvY2F0b3Jfc2ltcGxlLmMgYi9saWIvaW50ZWxfYWxs
b2NhdG9yX3NpbXBsZS5jCmluZGV4IDBlNjc2Mzk2NC4uOGQ1MTA1ZjExIDEwMDY0NAotLS0gYS9s
aWIvaW50ZWxfYWxsb2NhdG9yX3NpbXBsZS5jCisrKyBiL2xpYi9pbnRlbF9hbGxvY2F0b3Jfc2lt
cGxlLmMKQEAgLTUyMyw2ICs1MjMsOCBAQCBzdGF0aWMgYm9vbCBpbnRlbF9hbGxvY2F0b3Jfc2lt
cGxlX3Jlc2VydmUoc3RydWN0IGludGVsX2FsbG9jYXRvciAqaWFsLAogCWVuZCA9IERFQ0FOT05J
Q0FMKGVuZCk7CiAJaWd0X2Fzc2VydChlbmQgPiBzdGFydCB8fCBlbmQgPT0gMCk7CiAJc2l6ZSA9
IGdldF9zaXplKHN0YXJ0LCBlbmQpOworCWlndF9hc3NlcnQoc3RhcnQgKyBzaXplIDw9IGlhbHMt
PmVuZCk7CisJaWd0X2Fzc2VydChzdGFydCA+PSBpYWxzLT5zdGFydCk7CiAKIAlpZiAoc2ltcGxl
X3ZtYV9oZWFwX2FsbG9jX2FkZHIoaWFscywgc3RhcnQsIHNpemUpKSB7CiAJCXJlYyA9IG1hbGxv
YyhzaXplb2YoKnJlYykpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXYK
