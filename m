Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E328E6F892
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Jan 2020 18:14:27 +0000 (UTC)
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Date: Fri, 17 Jan 2020 10:14:17 -0800
Message-Id: <20200117181418.18755-1-jose.souza@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 1/2] lib: Add support to connector path
 property
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

VGhpcyBwcm9wZXJ0eSBpcyBzZXQgd2l0aCB0aGUgRFAgTVNUIHBhdGggb2YgdGhlIGNvbm5lY3Rv
ci4KCkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpT
aWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNv
bT4KLS0tCiBsaWIvaWd0X2ttcy5jIHwgMSArCiBsaWIvaWd0X2ttcy5oIHwgMSArCiAyIGZpbGVz
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3Rfa21zLmMgYi9s
aWIvaWd0X2ttcy5jCmluZGV4IGQyMGRhYWFkLi5iOWJiYzFhNCAxMDA2NDQKLS0tIGEvbGliL2ln
dF9rbXMuYworKysgYi9saWIvaWd0X2ttcy5jCkBAIC00MTYsNiArNDE2LDcgQEAgY29uc3QgY2hh
ciAqIGNvbnN0IGlndF9jb25uZWN0b3JfcHJvcF9uYW1lc1tJR1RfTlVNX0NPTk5FQ1RPUl9QUk9Q
U10gPSB7CiAJW0lHVF9DT05ORUNUT1JfVlJSX0NBUEFCTEVdID0gInZycl9jYXBhYmxlIiwKIAlb
SUdUX0NPTk5FQ1RPUl9IRENQX0NPTlRFTlRfVFlQRV0gPSAiSERDUCBDb250ZW50IFR5cGUiLAog
CVtJR1RfQ09OTkVDVE9SX0xJTktfU1RBVFVTXSA9ICJsaW5rLXN0YXR1cyIsCisJW0lHVF9DT05O
RUNUT1JfUEFUSF0gPSAiUEFUSCIsCiB9OwogCiAvKgpkaWZmIC0tZ2l0IGEvbGliL2lndF9rbXMu
aCBiL2xpYi9pZ3Rfa21zLmgKaW5kZXggNmM5MTllOTIuLjA5M2E5NzBhIDEwMDY0NAotLS0gYS9s
aWIvaWd0X2ttcy5oCisrKyBiL2xpYi9pZ3Rfa21zLmgKQEAgLTEyNSw2ICsxMjUsNyBAQCBlbnVt
IGlndF9hdG9taWNfY29ubmVjdG9yX3Byb3BlcnRpZXMgewogICAgICAgIElHVF9DT05ORUNUT1Jf
VlJSX0NBUEFCTEUsCiAgICAgICAgSUdUX0NPTk5FQ1RPUl9IRENQX0NPTlRFTlRfVFlQRSwKICAg
ICAgICBJR1RfQ09OTkVDVE9SX0xJTktfU1RBVFVTLAorICAgICAgIElHVF9DT05ORUNUT1JfUEFU
SCwKICAgICAgICBJR1RfTlVNX0NPTk5FQ1RPUl9QUk9QUwogfTsKIAotLSAKMi4yNS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYK
