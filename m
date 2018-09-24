Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mblankhorst.nl (mblankhorst.nl
 [IPv6:2a02:2308::216:3eff:fe92:dfa3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63D156E1DE
 for <igt-dev@lists.freedesktop.org>; Mon, 24 Sep 2018 06:44:53 +0000 (UTC)
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date: Mon, 24 Sep 2018 08:44:49 +0200
Message-Id: <20180924064449.25013-1-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] kms_plane: Do not leave CRC generation
 running while creating a format.
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

Q3JlYXRpbmcgYSBZVVYgRkIgaW4gYSBoaWdoIHJlc29sdXRpb24gdGFrZXMgdG9vIGxvbmcsIGFu
ZCB3ZSBlbmQgdXAgd2l0aDoKW2RybTpkcm1fY3J0Y19hZGRfY3JjX2VudHJ5XSAqRVJST1IqIE92
ZXJmbG93IG9mIENSQyBidWZmZXIsIHVzZXJzcGFjZSByZWFkcyB0b28gc2xvdy4KCkJ1Z3ppbGxh
OiBodHRwczovL2J1Z3MuZnJlZWRlc2t0b3Aub3JnL3Nob3dfYnVnLmNnaT9pZD0xMDY4ODUKU2ln
bmVkLW9mZi1ieTogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiB0ZXN0cy9rbXNfcGxhbmUuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvdGVzdHMva21zX3Bs
YW5lLmMgYi90ZXN0cy9rbXNfcGxhbmUuYwppbmRleCBhYTM2ZGRlYmEzMWEuLmQwMGJhZWFmZjcy
ZCAxMDA2NDQKLS0tIGEvdGVzdHMva21zX3BsYW5lLmMKKysrIGIvdGVzdHMva21zX3BsYW5lLmMK
QEAgLTQxOSw3ICs0MTksNyBAQCBzdGF0aWMgdm9pZCB0ZXN0X2Zvcm1hdF9wbGFuZV9jb2xvcihk
YXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLAogCWlndF9wbGFuZV9zZXRfZmIocGxhbmUsIGZi
KTsKIAogCWlndF9kaXNwbGF5X2NvbW1pdDIoJmRhdGEtPmRpc3BsYXksIGRhdGEtPmRpc3BsYXku
aXNfYXRvbWljID8gQ09NTUlUX0FUT01JQyA6IENPTU1JVF9VTklWRVJTQUwpOwotCWlndF9waXBl
X2NyY19nZXRfY3VycmVudChkYXRhLT5kaXNwbGF5LmRybV9mZCwgZGF0YS0+cGlwZV9jcmMsIGNy
Yyk7CisJaWd0X3BpcGVfY3JjX2NvbGxlY3RfY3JjKGRhdGEtPnBpcGVfY3JjLCBjcmMpOwogCiAJ
aWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZvbGRfZmIpOwogfQpAQCAtNDY2LDcgKzQ2Niw2
IEBAIHN0YXRpYyB2b2lkIHRlc3RfZm9ybWF0X3BsYW5lKGRhdGFfdCAqZGF0YSwgZW51bSBwaXBl
IHBpcGUsCiAJc2V0X2xlZ2FjeV9sdXQoZGF0YSwgcGlwZSwgMHhmYzAwKTsKIAogCXRlc3RfaW5p
dChkYXRhLCBwaXBlKTsKLQlpZ3RfcGlwZV9jcmNfc3RhcnQoZGF0YS0+cGlwZV9jcmMpOwogCiAJ
aWd0X2luZm8oIlRlc3RpbmcgZm9ybWF0ICIgSUdUX0ZPUk1BVF9GTVQgIiBvbiAlcy4ldVxuIiwK
IAkJIElHVF9GT1JNQVRfQVJHUyhmb3JtYXQpLAotLSAKMi4xOS4wCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3Qt
ZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
