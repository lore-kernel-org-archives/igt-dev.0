Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7900E6E499
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Jan 2019 12:37:27 +0000 (UTC)
From: Petri Latvala <petri.latvala@intel.com>
Date: Mon, 28 Jan 2019 14:37:17 +0200
Message-Id: <20190128123717.23691-1-petri.latvala@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/gem_exec_capture: Compare instead of
 assign in an assert
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogUGV0cmkgTGF0dmFsYSA8cGV0cmkubGF0dmFsYUBpbnRlbC5jb20+CkNj
OiBDaHJpcyBXaWxzb24gPGNocmlzQGNocmlzLXdpbHNvbi5jby51az4KLS0tCiB0ZXN0cy9pOTE1
L2dlbV9leGVjX2NhcHR1cmUuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX2V4ZWNfY2FwdHVy
ZS5jIGIvdGVzdHMvaTkxNS9nZW1fZXhlY19jYXB0dXJlLmMKaW5kZXggNDkzOTRjMzEuLmVjYTcz
YWIxIDEwMDY0NAotLS0gYS90ZXN0cy9pOTE1L2dlbV9leGVjX2NhcHR1cmUuYworKysgYi90ZXN0
cy9pOTE1L2dlbV9leGVjX2NhcHR1cmUuYwpAQCAtNDQ1LDcgKzQ0NSw3IEBAIHN0YXRpYyB2b2lk
IG1hbnkoaW50IGZkLCBpbnQgZGlyLCB1aW50NjRfdCBzaXplLCB1bnNpZ25lZCBpbnQgZmxhZ3Mp
CiAJCWFkZHIgPSBzdHJ0b3VsKHN0ciwgJnN0ciwgMTYpOwogCQlhZGRyIDw8PSAzMjsKIAkJYWRk
ciB8PSBzdHJ0b3VsKHN0ciArIDEsICZzdHIsIDE2KTsKLQkJaWd0X2Fzc2VydCgqc3RyKysgPSAn
XG4nKTsKKwkJaWd0X2Fzc2VydCgqc3RyKysgPT0gJ1xuJyk7CiAKIAkJaWYgKCEoKnN0ciA9PSAn
OicgfHwgKnN0ciA9PSAnficpKQogCQkJY29udGludWU7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYgbWFpbGluZyBsaXN0
CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
