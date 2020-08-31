Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6B96E288
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2020 13:32:41 +0000 (UTC)
From: =?UTF-8?q?Zbigniew=20Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Date: Mon, 31 Aug 2020 15:30:46 +0200
Message-Id: <20200831133049.37017-38-zbigniew.kempczynski@intel.com>
In-Reply-To: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
References: <20200831133049.37017-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v33 37/40] tests/gem_ppgtt: address review
 comments (use device mapping)
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
Cc: Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

VXNlIGRldmljZSBtYXBwaW5nIHRvIGJlIGNvbnNpc3RlZCB3aGVuIGV4ZXJjaXNpbmcgY29oZXJl
bmN5IGluIHRoZSB0ZXN0cy4KClNpZ25lZC1vZmYtYnk6IFpiaWduaWV3IEtlbXBjennFhHNraSA8
emJpZ25pZXcua2VtcGN6eW5za2lAaW50ZWwuY29tPgpDYzogRG9taW5payBHcnplZ29yemVrIDxk
b21pbmlrLmdyemVnb3J6ZWtAaW50ZWwuY29tPgpDYzogQ2hyaXMgV2lsc29uIDxjaHJpc0BjaHJp
cy13aWxzb24uY28udWs+Ci0tLQogdGVzdHMvaTkxNS9nZW1fcHBndHQuYyB8IDcgKy0tLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL3Rlc3RzL2k5MTUvZ2VtX3BwZ3R0LmMgYi90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCmluZGV4
IGU0YjFmZTQ1Li5iZjQxMmJmMiAxMDA2NDQKLS0tIGEvdGVzdHMvaTkxNS9nZW1fcHBndHQuYwor
KysgYi90ZXN0cy9pOTE1L2dlbV9wcGd0dC5jCkBAIC00OCwxNCArNDgsOSBAQCBzdGF0aWMgc3Ry
dWN0IGludGVsX2J1ZiAqY3JlYXRlX2JvKHN0cnVjdCBidWZfb3BzICpib3BzLCB1aW50MzJfdCBw
aXhlbCkKIHsKIAl1aW50NjRfdCB2YWx1ZSA9ICh1aW50NjRfdClwaXhlbCA8PCAzMiB8IHBpeGVs
LCAqdjsKIAlzdHJ1Y3QgaW50ZWxfYnVmICpidWY7Ci0JaW50IGk5MTUgPSBidWZfb3BzX2dldF9m
ZChib3BzKTsKIAogCWJ1ZiA9IGludGVsX2J1Zl9jcmVhdGUoYm9wcywgV0lEVEgsIEhFSUdIVCwg
MzIsIDAsIEk5MTVfVElMSU5HX05PTkUsIDApOwotCi0JaWYgKGdlbV9oYXNfbGxjKGk5MTUpKQot
CQl2ID0gaW50ZWxfYnVmX2NwdV9tYXAoYnVmLCB0cnVlKTsKLQllbHNlCi0JCXYgPSBpbnRlbF9i
dWZfZGV2aWNlX21hcChidWYsIHRydWUpOworCXYgPSBpbnRlbF9idWZfZGV2aWNlX21hcChidWYs
IHRydWUpOwogCiAJZm9yIChpbnQgaSA9IDA7IGkgPCBTSVpFIC8gc2l6ZW9mKHZhbHVlKTsgaSAr
PSA4KSB7CiAJCXZbaSArIDBdID0gdmFsdWU7IHZbaSArIDFdID0gdmFsdWU7Ci0tIAoyLjI2LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmlndC1kZXYg
bWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
