Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23F6EBA8
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Jul 2021 13:46:43 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 26 Jul 2021 15:45:31 +0200
Message-Id: <20210726134616.49873-8-zbigniew.kempczynski@intel.com>
In-Reply-To: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
References: <20210726134616.49873-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 07/52] lib/intel_batchbuffer: Try to
 avoid relocations in blitting
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
Cc: Petri Latvala <petri.latvala@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

V2UncmUgcHJvcG9zaW5nIG5vdCBvdmVybGFwcGluZyBvZmZzZXRzIGluIGJvdGggYmxpdHRlciBj
b3B5aW5nIGZ1bmN0aW9ucwpzbyB3ZSBjYW4gdHJ5IHRvIHNraXAgcmVsb2NhdGlvbnMuCgpTaWdu
ZWQtb2ZmLWJ5OiBaYmlnbmlldyBLZW1wY3p5xYRza2kgPHpiaWduaWV3LmtlbXBjenluc2tpQGlu
dGVsLmNvbT4KQ2M6IFBldHJpIExhdHZhbGEgPHBldHJpLmxhdHZhbGFAaW50ZWwuY29tPgpDYzog
QXNodXRvc2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4KQ2M6IENocmlzIFdpbHNv
biA8Y2hyaXNAY2hyaXMtd2lsc29uLmNvLnVrPgotLS0KIGxpYi9pbnRlbF9iYXRjaGJ1ZmZlci5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMgYi9saWIvaW50ZWxfYmF0Y2hidWZm
ZXIuYwppbmRleCBkNGE1OWU1MDguLmJiZjhlMGRhMiAxMDA2NDQKLS0tIGEvbGliL2ludGVsX2Jh
dGNoYnVmZmVyLmMKKysrIGIvbGliL2ludGVsX2JhdGNoYnVmZmVyLmMKQEAgLTcxMSw3ICs3MTEs
NyBAQCBzdGF0aWMgdm9pZCBleGVjX2JsaXQoaW50IGZkLAogCXN0cnVjdCBkcm1faTkxNV9nZW1f
ZXhlY2J1ZmZlcjIgZXhlYyA9IHsKIAkJLmJ1ZmZlcnNfcHRyID0gdG9fdXNlcl9wb2ludGVyKG9i
anMpLAogCQkuYnVmZmVyX2NvdW50ID0gY291bnQsCi0JCS5mbGFncyA9IGdlbiA+PSA2ID8gSTkx
NV9FWEVDX0JMVCA6IDAsCisJCS5mbGFncyA9IGdlbiA+PSA2ID8gSTkxNV9FWEVDX0JMVCA6IDAg
fCBJOTE1X0VYRUNfTk9fUkVMT0MsCiAJCS5yc3ZkMSA9IGN0eCwKIAl9OwogCi0tIAoyLjI2LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
