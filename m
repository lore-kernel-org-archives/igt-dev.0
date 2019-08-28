Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46705894E7
 for <igt-dev@lists.freedesktop.org>; Wed, 28 Aug 2019 11:59:48 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 28 Aug 2019 15:00:45 +0300
Message-Id: <20190828120046.24259-2-simon.ser@intel.com>
In-Reply-To: <20190828120046.24259-1-simon.ser@intel.com>
References: <20190828120046.24259-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t v2 1/2] lib/igt_kms: add the PATH property
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

VGhpcyBhbGxvd3MgdGVzdHMgdG8gZGV0ZWN0IERQLU1TVCBjb25uZWN0b3JzIChQQVRIIHN0YXJ0
cyB3aXRoICJtc3Q6IiBpbiB0aGlzCmNhc2UpLgoKU2lnbmVkLW9mZi1ieTogU2ltb24gU2VyIDxz
aW1vbi5zZXJAaW50ZWwuY29tPgotLS0KIGxpYi9pZ3Rfa21zLmMgfCAxICsKIGxpYi9pZ3Rfa21z
LmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEv
bGliL2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggMTdhN2QyYjY3ZjgyLi44NDhjMWZm
OTIxZmEgMTAwNjQ0Ci0tLSBhL2xpYi9pZ3Rfa21zLmMKKysrIGIvbGliL2lndF9rbXMuYwpAQCAt
NDEyLDYgKzQxMiw3IEBAIGNvbnN0IGNoYXIgKiBjb25zdCBpZ3RfY29ubmVjdG9yX3Byb3BfbmFt
ZXNbSUdUX05VTV9DT05ORUNUT1JfUFJPUFNdID0gewogCVtJR1RfQ09OTkVDVE9SX1ZSUl9DQVBB
QkxFXSA9ICJ2cnJfY2FwYWJsZSIsCiAJW0lHVF9DT05ORUNUT1JfSERDUF9DT05URU5UX1RZUEVd
ID0gIkhEQ1AgQ29udGVudCBUeXBlIiwKIAlbSUdUX0NPTk5FQ1RPUl9MSU5LX1NUQVRVU10gPSAi
bGluay1zdGF0dXMiLAorCVtJR1RfQ09OTkVDVE9SX1BBVEhdID0gIlBBVEgiLAogfTsKIAogLyoK
ZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmggYi9saWIvaWd0X2ttcy5oCmluZGV4IDU2NDgxZmQx
OGM4Ny4uMWE3NTA3ZmZmOWUzIDEwMDY0NAotLS0gYS9saWIvaWd0X2ttcy5oCisrKyBiL2xpYi9p
Z3Rfa21zLmgKQEAgLTEyNSw2ICsxMjUsNyBAQCBlbnVtIGlndF9hdG9taWNfY29ubmVjdG9yX3By
b3BlcnRpZXMgewogICAgICAgIElHVF9DT05ORUNUT1JfVlJSX0NBUEFCTEUsCiAgICAgICAgSUdU
X0NPTk5FQ1RPUl9IRENQX0NPTlRFTlRfVFlQRSwKICAgICAgICBJR1RfQ09OTkVDVE9SX0xJTktf
U1RBVFVTLAorICAgICAgIElHVF9DT05ORUNUT1JfUEFUSCwKICAgICAgICBJR1RfTlVNX0NPTk5F
Q1RPUl9QUk9QUwogfTsKIAotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2lndC1kZXY=
