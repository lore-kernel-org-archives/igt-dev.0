Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAB7972FB3
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 20:01:31 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 22:00:09 +0200
Message-Id: <20210726200026.4815-36-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
References: <20210726200026.4815-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v3 35/52] tests/gem_unfence_active_buffers:
 Adopt to use allocator
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

Rm9yIG5ld2VyIGdlbnMgd2UncmUgbm90IGFibGUgdG8gcmVseSBvbiByZWxvY2F0aW9ucy4gQWRv
cHQgdG8gdXNlCm9mZnNldHMgYWNxdWlyZWQgZnJvbSB0aGUgYWxsb2NhdG9yLgoKU2lnbmVkLW9m
Zi1ieTogWmJpZ25pZXcgS2VtcGN6ecWEc2tpIDx6Ymlnbmlldy5rZW1wY3p5bnNraUBpbnRlbC5j
b20+CkNjOiBQZXRyaSBMYXR2YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KQ2M6IEFzaHV0
b3NoIERpeGl0IDxhc2h1dG9zaC5kaXhpdEBpbnRlbC5jb20+Ci0tLQogdGVzdHMvaTkxNS9nZW1f
dW5mZW5jZV9hY3RpdmVfYnVmZmVycy5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL3Rlc3RzL2k5MTUvZ2VtX3Vu
ZmVuY2VfYWN0aXZlX2J1ZmZlcnMuYyBiL3Rlc3RzL2k5MTUvZ2VtX3VuZmVuY2VfYWN0aXZlX2J1
ZmZlcnMuYwppbmRleCAyYzljZWJiNmQuLjUzMmVlZDJlNyAxMDA2NDQKLS0tIGEvdGVzdHMvaTkx
NS9nZW1fdW5mZW5jZV9hY3RpdmVfYnVmZmVycy5jCisrKyBiL3Rlc3RzL2k5MTUvZ2VtX3VuZmVu
Y2VfYWN0aXZlX2J1ZmZlcnMuYwpAQCAtNjksMTEgKzY5LDEzIEBAIGlndF9zaW1wbGVfbWFpbgog
ewogCWludCBpOTE1LCBudW1fZmVuY2VzOwogCWlndF9zcGluX3QgKnNwaW47CisJdWludDY0X3Qg
YWhuZDsKIAogCWk5MTUgPSBkcm1fb3Blbl9kcml2ZXIoRFJJVkVSX0lOVEVMKTsKIAlpZ3RfcmVx
dWlyZV9nZW0oaTkxNSk7CiAKLQlzcGluID0gaWd0X3NwaW5fbmV3KGk5MTUpOworCWFobmQgPSBn
ZXRfcmVsb2NfYWhuZChpOTE1LCAwKTsKKwlzcGluID0gaWd0X3NwaW5fbmV3KGk5MTUsIC5haG5k
ID0gYWhuZCk7CiAKIAludW1fZmVuY2VzID0gZ2VtX2F2YWlsYWJsZV9mZW5jZXMoaTkxNSk7CiAJ
aWd0X3JlcXVpcmUobnVtX2ZlbmNlcyk7CkBAIC05Niw0ICs5OCw1IEBAIGlndF9zaW1wbGVfbWFp
bgogCX0KIAogCWlndF9zcGluX2ZyZWUoaTkxNSwgc3Bpbik7CisJcHV0X2FobmQoYWhuZCk7CiB9
Ci0tIAoyLjI2LjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
