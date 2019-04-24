Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0733589077
 for <igt-dev@lists.freedesktop.org>; Wed, 24 Apr 2019 07:01:19 +0000 (UTC)
From: Simon Ser <simon.ser@intel.com>
Date: Wed, 24 Apr 2019 10:01:29 +0300
Message-Id: <20190424070129.8591-1-simon.ser@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t] lib/igt_halffloat: fix compilation with
 Clang
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

VGhlIHNvdXJjZSBmaWxlIGNvbnRhaW5zIGEgc3BlY2lhbCBjb2RlLXBhdGggZm9yIENsYW5nLCBo
b3dldmVyIHRoaXMgcGF0aCBmYWlscwp0byBjb21waWxlOgoKICAuLi9saWIvaWd0X2hhbGZmbG9h
dC5jOjIyNzo3OiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yICdpZ3RfaGFsZl90b19mbG9h
dCcKICBmbG9hdCBpZ3RfaGFsZl90b19mbG9hdChjb25zdCB1aW50MTZfdCAqaCwgZmxvYXQgKmYs
IHVuc2lnbmVkIGludCBudW0pCiAgICAgICAgXgogIC4uL2xpYi9pZ3RfaGFsZmZsb2F0Lmg6MjY6
Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gaXMgaGVyZQogIHZvaWQgaWd0X2hhbGZfdG9f
ZmxvYXQoY29uc3QgdWludDE2X3QgKmgsIGZsb2F0ICpmLCB1bnNpZ25lZCBpbnQgbnVtKTsKICAg
ICAgIF4KICAxIGVycm9yIGdlbmVyYXRlZC4KClRoaXMgY29tbWl0IGZpeGVzIHRoaXMgbWlzbWF0
Y2guCgpTaWduZWQtb2ZmLWJ5OiBTaW1vbiBTZXIgPHNpbW9uLnNlckBpbnRlbC5jb20+Ci0tLQog
bGliL2lndF9oYWxmZmxvYXQuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2xpYi9pZ3RfaGFsZmZsb2F0LmMgYi9saWIv
aWd0X2hhbGZmbG9hdC5jCmluZGV4IDI2M2IyOGMxLi4wOGFiMDVmYyAxMDA2NDQKLS0tIGEvbGli
L2lndF9oYWxmZmxvYXQuYworKysgYi9saWIvaWd0X2hhbGZmbG9hdC5jCkBAIC0yMjQsNyArMjI0
LDcgQEAgdm9pZCBpZ3RfZmxvYXRfdG9faGFsZihjb25zdCBmbG9hdCAqZiwgdWludDE2X3QgKmgs
IHVuc2lnbmVkIGludCBudW0pCiAJCWhbaV0gPSBfZmxvYXRfdG9faGFsZihmW2ldKTsKIH0KIAot
ZmxvYXQgaWd0X2hhbGZfdG9fZmxvYXQoY29uc3QgdWludDE2X3QgKmgsIGZsb2F0ICpmLCB1bnNp
Z25lZCBpbnQgbnVtKQordm9pZCBpZ3RfaGFsZl90b19mbG9hdChjb25zdCB1aW50MTZfdCAqaCwg
ZmxvYXQgKmYsIHVuc2lnbmVkIGludCBudW0pCiB7CiAJZm9yIChpbnQgaSA9IDA7IGkgPCBudW07
IGkrKykKIAkJZltpXSA9IF9oYWxmX3RvX2Zsb2F0KGhbaV0pOwotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwppZ3QtZGV2IG1haWxpbmcg
bGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
