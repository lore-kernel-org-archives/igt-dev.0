Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 120F56E44E
 for <igt-dev@lists.freedesktop.org>; Mon, 26 Feb 2018 11:16:04 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 26 Feb 2018 12:15:56 +0100
Message-Id: <20180226111558.58056-3-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20180226111558.58056-1-maarten.lankhorst@linux.intel.com>
References: <20180226111558.58056-1-maarten.lankhorst@linux.intel.com>
Subject: [igt-dev] [PATCH i-g-t 2/4] lib/igt_kms: Fix igt_plane_reset to
 handle cursor planes correctly too
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

U2lnbmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9saWIvaWd0X2ttcy5jIGIvbGliL2lndF9rbXMuYwpp
bmRleCBkOGM4ZTdhM2NkZmIuLjU5MDBjNDYyOTZhMCAxMDA2NDQKLS0tIGEvbGliL2lndF9rbXMu
YworKysgYi9saWIvaWd0X2ttcy5jCkBAIC0xNzI0LDYgKzE3MjQsNyBAQCBzdGF0aWMgdm9pZCBp
Z3RfcGxhbmVfcmVzZXQoaWd0X3BsYW5lX3QgKnBsYW5lKQogCiAJaWd0X3BsYW5lX2NsZWFyX3By
b3BfY2hhbmdlZChwbGFuZSwgSUdUX1BMQU5FX0lOX0ZFTkNFX0ZEKTsKIAlwbGFuZS0+dmFsdWVz
W0lHVF9QTEFORV9JTl9GRU5DRV9GRF0gPSB+MFVMTDsKKwlwbGFuZS0+Z2VtX2hhbmRsZSA9IDA7
CiB9CiAKIHN0YXRpYyB2b2lkIGlndF9waXBlX3Jlc2V0KGlndF9waXBlX3QgKnBpcGUpCi0tIAoy
LjE2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmln
dC1kZXYgbWFpbGluZyBsaXN0CmlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldgo=
