Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E244B6E42E
 for <igt-dev@lists.freedesktop.org>; Thu, 20 Jun 2019 12:29:09 +0000 (UTC)
From: Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Date: Thu, 20 Jun 2019 15:29:01 +0300
Message-Id: <20190620122902.20761-2-arkadiusz.hiler@intel.com>
In-Reply-To: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
References: <20190620122902.20761-1-arkadiusz.hiler@intel.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 2/3] runner/resultgen: Don't pass NULL to
 str*() functions
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
Cc: Petri Latvala <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

SWYgd2UgZG9uJ3QgZ2V0IHZhbHVlcyBmcm9tIHRoZSBKU09OIHN0cmxlbigpIGFuZCBzdHJjbXAo
KSBvbiB0aGVtIHdvdWxkCmRlcmVmZXJlbmNlIE5VTEwgcG9pbnRlci4KCkNjOiBQZXRyaSBMYXR2
YWxhIDxwZXRyaS5sYXR2YWxhQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQXJrYWRpdXN6IEhp
bGVyIDxhcmthZGl1c3ouaGlsZXJAaW50ZWwuY29tPgotLS0KIHJ1bm5lci9yZXN1bHRnZW4uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL3J1bm5lci9yZXN1bHRnZW4uYyBiL3J1bm5lci9yZXN1bHRnZW4uYwppbmRleCA3
YjRjZDUxOS4uNThiOTUyMjAgMTAwNjQ0Ci0tLSBhL3J1bm5lci9yZXN1bHRnZW4uYworKysgYi9y
dW5uZXIvcmVzdWx0Z2VuLmMKQEAgLTg2Niw3ICs4NjYsNyBAQCBzdGF0aWMgdm9pZCBmaWxsX2Zy
b21fam91cm5hbChpbnQgZmQsCiAKIHN0YXRpYyB2b2lkIG92ZXJyaWRlX3Jlc3VsdF9zaW5nbGUo
c3RydWN0IGpzb25fb2JqZWN0ICpvYmopCiB7Ci0JY29uc3QgY2hhciAqZXJydGV4dCA9IE5VTEws
ICpyZXN1bHQgPSBOVUxMOworCWNvbnN0IGNoYXIgKmVycnRleHQgPSAiIiwgKnJlc3VsdCA9ICIi
OwogCXN0cnVjdCBqc29uX29iamVjdCAqdGV4dG9iajsKIAlib29sIGRtZXNnd2FybnMgPSBmYWxz
ZTsKIAotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwppZ3QtZGV2IG1haWxpbmcgbGlzdAppZ3QtZGV2QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXY=
