Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21776E106
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Jan 2021 16:17:06 +0000 (UTC)
From: Ville Syrjala <ville.syrjala@linux.intel.com>
Date: Mon, 11 Jan 2021 18:16:58 +0200
Message-Id: <20210111161658.3476-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Skip the Y<->X tile
 test on pre-skl
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClBy
ZS1za2wgZGlzcGxheSBlbmdpbmUgZG9lcyBub3Qgc3VwcG9ydCBZLXRpbGluZyBzbyB0aGUKYWRk
ZmIgd2lsbCBmYWlsLiBTa2lwIHRoZSB0ZXN0IG9uIHN1Y2ggcGxhdGZvcm1zLgoKU2lnbmVkLW9m
Zi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0t
CiB0ZXN0cy9rbXNfYXN5bmNfZmxpcHMuYyB8IDMgKysrCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMgYi90ZXN0cy9r
bXNfYXN5bmNfZmxpcHMuYwppbmRleCBkZWEyM2NmOWVmMTUuLmUzOTdhNTRiODc0ZiAxMDA2NDQK
LS0tIGEvdGVzdHMva21zX2FzeW5jX2ZsaXBzLmMKKysrIGIvdGVzdHMva21zX2FzeW5jX2ZsaXBz
LmMKQEAgLTMzNSw2ICszMzUsOSBAQCBzdGF0aWMgdm9pZCB0ZXN0X2ludmFsaWQoZGF0YV90ICpk
YXRhKQogCXdpZHRoID0gZGF0YS0+Y29ubmVjdG9yLT5tb2Rlc1swXS5oZGlzcGxheTsKIAloZWln
aHQgPSBkYXRhLT5jb25uZWN0b3ItPm1vZGVzWzBdLnZkaXNwbGF5OwogCisJaWd0X3JlcXVpcmUo
aWd0X2Rpc3BsYXlfaGFzX2Zvcm1hdF9tb2QoJmRhdGEtPmRpc3BsYXksIERSTV9GT1JNQVRfWFJH
Qjg4ODgsCisJCQkJCSAgICAgICBMT0NBTF9JOTE1X0ZPUk1BVF9NT0RfWV9USUxFRCkpOworCiAJ
aWd0X2NyZWF0ZV9mYihkYXRhLT5kcm1fZmQsIHdpZHRoLCBoZWlnaHQsIERSTV9GT1JNQVRfWFJH
Qjg4ODgsCiAJCSAgICAgIExPQ0FMX0k5MTVfRk9STUFUX01PRF9ZX1RJTEVELCAmZmIpOwogCi0t
IAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmlndC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
