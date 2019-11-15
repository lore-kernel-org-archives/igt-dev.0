Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A3BC6EB50
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Nov 2019 23:16:26 +0000 (UTC)
From: Vanshidhar Konda <vanshidhar.r.konda@intel.com>
Date: Fri, 15 Nov 2019 15:16:25 -0800
Message-Id: <20191115231625.2368317-3-vanshidhar.r.konda@intel.com>
In-Reply-To: <20191115231625.2368317-1-vanshidhar.r.konda@intel.com>
References: <20191115231625.2368317-1-vanshidhar.r.konda@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH 2/2] i915/i915_fb_tiling: Check if device supports
 tiling
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
Cc: brian.welty@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

U2tpcCB0aGlzIHRlc3QgaWYgdGhlIHBsYXRmb3JtIGRvZXMgbm90IHN1cHBvcnQgc2V0dGluZyB0
aWxpbmcgZm9yIGZyYW1lCmJ1ZmZlciBvYmplY3QuCgpTaWduZWQtb2ZmLWJ5OiBWYW5zaGlkaGFy
IEtvbmRhIDx2YW5zaGlkaGFyLnIua29uZGFAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogQXNodXRv
c2ggRGl4aXQgPGFzaHV0b3NoLmRpeGl0QGludGVsLmNvbT4KLS0tCiB0ZXN0cy9pOTE1L2k5MTVf
ZmJfdGlsaW5nLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZm
IC0tZ2l0IGEvdGVzdHMvaTkxNS9pOTE1X2ZiX3RpbGluZy5jIGIvdGVzdHMvaTkxNS9pOTE1X2Zi
X3RpbGluZy5jCmluZGV4IDdkNWMzZjFmLi40ZWM4NDk2MiAxMDA2NDQKLS0tIGEvdGVzdHMvaTkx
NS9pOTE1X2ZiX3RpbGluZy5jCisrKyBiL3Rlc3RzL2k5MTUvaTkxNV9mYl90aWxpbmcuYwpAQCAt
MzIsNiArMzIsOCBAQCBpZ3Rfc2ltcGxlX21haW4KIAlzdHJ1Y3QgaWd0X2ZiIGZiOwogCWludCBy
ZXQ7CiAKKwlpZ3RfcmVxdWlyZShnZW1faGFzX2xlZ2FjeV9od190aWxpbmcoZHJtX2ZkKSk7CisK
IAlpZ3RfY3JlYXRlX2ZiKGRybV9mZCwgNTEyLCA1MTIsIERSTV9GT1JNQVRfWFJHQjg4ODgsCiAJ
CSAgICAgIExPQ0FMX0k5MTVfRk9STUFUX01PRF9YX1RJTEVELCAmZmIpOwogCi0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg==
