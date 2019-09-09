Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B881895C8
 for <igt-dev@lists.freedesktop.org>; Mon,  9 Sep 2019 12:10:25 +0000 (UTC)
From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
Date: Mon,  9 Sep 2019 15:08:16 +0300
Message-Id: <20190909120816.26074-1-stanislav.lisovskiy@intel.com>
Subject: [igt-dev] [PATCH i-g-t v1] igt/lib: Don't refresh output in
 igt_output_set_pipe
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
Cc: Stanislav.Lisovskiy@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

VGhlcmUgYXJlIHNvbWUgYnVncyB3aGVyZSBEUCBzZWVtcyB0byBkaXNzYXBwZWFyIGluIHRoZQpt
aWRkbGUgb2YgdGVzdCBjYXNlLCB3aGljaCBjYXVzZXMgZ2FyYmFnZSBtb2RlcyBiZWluZyByZXR1
cm5lZApmb3Igb3V0cHV0IGNhdXNpbmcgc29tZSB0ZXN0IGNhc2VzIHRvIGZhaWwgaW4gdW5leHBl
Y3RlZCBwbGFjZXMuCmlndF9vdXRwdXRfcmVmcmVzaCBzaG91bGQgb25seSBiZSBjYWxsZWQgZHVy
aW5nIGlndF9kaXNwbGF5X3JlcXVpcmUuCgpGaXhlczogaHR0cHM6Ly9idWdzLmZyZWVkZXNrdG9w
Lm9yZy9zaG93X2J1Zy5jZ2k/aWQ9MTA5NDk1CgpTaWduZWQtb2ZmLWJ5OiBTdGFuaXNsYXYgTGlz
b3Zza2l5IDxzdGFuaXNsYXYubGlzb3Zza2l5QGludGVsLmNvbT4KLS0tCiBsaWIvaWd0X2ttcy5j
IHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbGli
L2lndF9rbXMuYyBiL2xpYi9pZ3Rfa21zLmMKaW5kZXggMTdhN2QyYjYuLjZkOTkwMjIxIDEwMDY0
NAotLS0gYS9saWIvaWd0X2ttcy5jCisrKyBiL2xpYi9pZ3Rfa21zLmMKQEAgLTM3NTQsOCArMzc1
NCw2IEBAIHZvaWQgaWd0X291dHB1dF9zZXRfcGlwZShpZ3Rfb3V0cHV0X3QgKm91dHB1dCwgZW51
bSBwaXBlIHBpcGUpCiAKIAlpZ3Rfb3V0cHV0X3NldF9wcm9wX3ZhbHVlKG91dHB1dCwgSUdUX0NP
Tk5FQ1RPUl9DUlRDX0lELCBwaXBlID09IFBJUEVfTk9ORSA/IDAgOiBkaXNwbGF5LT5waXBlc1tw
aXBlXS5jcnRjX2lkKTsKIAotCWlndF9vdXRwdXRfcmVmcmVzaChvdXRwdXQpOwotCiAJaWYgKHBp
cGVfb2JqKSB7CiAJCWlmIChkaXNwbGF5LT5pc19hdG9taWMpCiAJCQlpZ3RfcGlwZV9vYmpfcmVw
bGFjZV9wcm9wX2Jsb2IocGlwZV9vYmosIElHVF9DUlRDX01PREVfSUQsIGlndF9vdXRwdXRfZ2V0
X21vZGUob3V0cHV0KSwgc2l6ZW9mKGRybU1vZGVNb2RlSW5mbykpOwotLSAKMi4xNy4xCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxp
bmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVk
ZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
